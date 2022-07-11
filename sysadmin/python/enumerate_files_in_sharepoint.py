from shareplum import Office365
from shareplum import Site
from shareplum.site import Version
import csv
import time

url = 'https://<ORGANIZATION_SHAREPOINT_DOMAIN>/'
authcookie = Office365(
    url,
    username='<SHAREPOINT_ADMIN_EMAIL_ADDRESS>',
    password='<SHAREPOINT_ADMIN_PASSWORD>').GetCookies()

site = Site(
    url,
    version=Version.v365,
    authcookie=authcookie)

names_of_folders = [ "<NAME_OF_SHAREPOINT_FOLDER1>", "<NAME_OF_SHAREPOINT_FOLDER2>" ]

# LOOP THROUGH FOLDERS
with open('sharepoint1.csv', 'a', newline='', encoding='utf-8') as f:
    writer = csv.writer(f)
    for i in range(len(names_of_folders)):
        # delay by 1 second to escape the 429 HTTP request error
        time.sleep(1)
        # list files in the folder
        list_of_files = site.Folder(names_of_folders[i]).files
        for j in range(len(list_of_files)):
            file_info = list_of_files[j]
            file_path = file_info["ServerRelativeUrl"].rsplit("/", 1)[0]
            file_name = file_info["ServerRelativeUrl"].rsplit("/", 1)[1]
            file_size = file_info["Length"]
            raw_date  = file_info["TimeLastModified"]
            file_year = raw_date[0:4]
            file_mont = raw_date[5:7]
            file_day  = raw_date[8:10]
            file_date = "%s/%s/%s" % (file_mont, file_day, file_year)
            writer.writerow([file_path, file_name, file_size, file_date])

        # LOOP THROUGH SUBFOLDERS
        names_of_subfolders = site.Folder(names_of_folders[i]).folders
        for k in range(len(names_of_subfolders)):
            # delay by 1 second to escape the 429 HTTP request error
            time.sleep(1)
            # skip if the folder has no sub-folders
            if(len(names_of_subfolders) == 1 and names_of_subfolders[k][0] == "Forms"):
                continue
            # find sub-folders that have a special character in the name
            # replace with two apostrophes to escape the HTTP request error
            if(bool(names_of_subfolders[k].find("\'") > 0)):
                names_of_subfolders[k] = names_of_subfolders[k].replace("\'", "\'\'")
                print("%s/%s" % (names_of_folders[i], names_of_subfolders[k]))
            if(bool(names_of_subfolders[k].find("#") > 0)):
                print("%s/%s" % (names_of_folders[i], names_of_subfolders[k]))
                continue
            # list files in the subfolders
            subfolder_path = "%s/%s" % (names_of_folders[i], names_of_subfolders[k])
            # subfolder_path = "Marketing/2018"
            files_in_subfolders = site.Folder(subfolder_path).files
            for l in range(len(files_in_subfolders)):
                # delay by 1 second to escape the 429 HTTP request error
                time.sleep(1)
                file_info = files_in_subfolders[l]
                file_path = file_info["ServerRelativeUrl"].rsplit("/", 1)[0]
                file_name = file_info["ServerRelativeUrl"].rsplit("/", 1)[1]
                file_size = file_info["Length"]
                raw_date  = file_info["TimeLastModified"]
                file_year = raw_date[0:4]
                file_mont = raw_date[5:7]
                file_day  = raw_date[8:10]
                file_date = "%s/%s/%s" % (file_mont, file_day, file_year)
                writer.writerow([file_path, file_name, file_size, file_date])

            # LOOP THROUGH SUB-SUBFOLDERS
            names_of_sub_subfolders = site.Folder(subfolder_path).folders
            for m in range(len(names_of_sub_subfolders)):
                # delay by 1 second to escape the 429 HTTP request error
                time.sleep(1)
                # skip if the sub-folder has no sub-subfolders
                if(len(names_of_sub_subfolders) == 1 and names_of_sub_subfolders[m][0] == "Forms"):
                    continue
                # find sub-subfolders that have an apostrophe in the name
                # replace with two apostrophes to escape the HTTP request error
                if(bool(names_of_sub_subfolders[m].find("\'") > 0)):
                    names_of_sub_subfolders[m] = names_of_sub_subfolders[m].replace("\'", "\'\'")
                    print("%s/%s" % (subfolder_path, names_of_sub_subfolders[m]))
                if(bool(names_of_sub_subfolders[m].find("#") > 0)):
                    print("%s/%s" % (subfolder_path, names_of_sub_subfolders[m]))
                    continue

                # list files in the sub-subfolders
                sub_subfolder_path = "%s/%s" % (subfolder_path, names_of_sub_subfolders[m])
                files_in_sub_subfolders = site.Folder(sub_subfolder_path).files
                for n in range(len(files_in_sub_subfolders)):
                    # delay by 1 second to escape the 429 HTTP request error
                    time.sleep(1)
                    file_info = files_in_sub_subfolders[n]
                    file_path = file_info["ServerRelativeUrl"].rsplit("/", 1)[0]
                    file_name = file_info["ServerRelativeUrl"].rsplit("/", 1)[1]
                    file_size = file_info["Length"]
                    raw_date  = file_info["TimeLastModified"]
                    file_year = raw_date[0:4]
                    file_mont = raw_date[5:7]
                    file_day  = raw_date[8:10]
                    file_date = "%s/%s/%s" % (file_mont, file_day, file_year)
                    writer.writerow([file_path, file_name, file_size, file_date])

                # LOOP THROUGH SUB-SUB-SUBFOLDERS
                names_of_sub_sub_subfolders = site.Folder(sub_subfolder_path).folders
                # names_of_sub_sub_subfolders[0] = "Excom Spring 2018"
                for o in range(len(names_of_sub_sub_subfolders)):
                    # delay by 1 second to escape the 429 HTTP request error
                    time.sleep(1)
                    # skip if the sub-folder has no sub-subfolders
                    if(len(names_of_sub_sub_subfolders) == 1 and names_of_sub_sub_subfolders[o][0] == "Forms"):
                        continue
                    # find sub-sub-subfolders that have an apostrophe in the name
                    # replace with two apostrophes to escape the HTTP request error
                    if(bool(names_of_sub_sub_subfolders[o].find("\'") > 0)):
                        names_of_sub_sub_subfolders[o] = names_of_sub_sub_subfolders[o].replace("\'", "\'\'")
                        print("%s/%s" % (sub_subfolder_path, names_of_sub_sub_subfolders[o]))
                    if(bool(names_of_sub_sub_subfolders[o].find("#") > 0)):
                        print("%s/%s" % (sub_subfolder_path, names_of_sub_sub_subfolders[o]))
                        continue

                    # list files in the sub-sub-subfolders
                    sub_sub_subfolder_path = "%s/%s" % (sub_subfolder_path, names_of_sub_sub_subfolders[o])
                    files_in_sub_sub_subfolders = site.Folder(sub_sub_subfolder_path).files
                    for p in range(len(files_in_sub_sub_subfolders)):
                        # delay by 1 second to escape the 429 HTTP request error
                        time.sleep(1)
                        file_info = files_in_sub_sub_subfolders[p]
                        file_path = file_info["ServerRelativeUrl"].rsplit("/", 1)[0]
                        file_name = file_info["ServerRelativeUrl"].rsplit("/", 1)[1]
                        file_size = file_info["Length"]
                        raw_date  = file_info["TimeLastModified"]
                        file_year = raw_date[0:4]
                        file_mont = raw_date[5:7]
                        file_day  = raw_date[8:10]
                        file_date = "%s/%s/%s" % (file_mont, file_day, file_year)
                        writer.writerow([file_path, file_name, file_size, file_date])
