
// This function returns all the files in a directory as an array of Strings  
String[] listFileNames(String dir) {
  File file = new File(dir);
  if (file.isDirectory()) {
    String names[] = file.list();
    return names;
  } 
  else {
    // If it's not a directory
    return null;
  }
}

// This function returns all the files in a directory as an array of File objects
// This is useful if you want more info about the file
File[] listFiles(String dir) {
  File file = new File(dir);
  if (file.isDirectory()) {
    File[] files = file.listFiles();
    return files;
  } 
  else {
    // If it's not a directory
    return null;
  }
}
ArrayList<File> listDirsRecursive(String dir) {
  ArrayList<File> fileList = new ArrayList<File>(); 
  recurseOnlyDir(fileList, dir, 300, 0,0);
  return fileList;
}
// Function to get a list of all files in a directory and all subdirectories
ArrayList<File> listFilesRecursive(String dir) {
  ArrayList<File> fileList = new ArrayList<File>(); 
  recurseDir(fileList, dir);
  return fileList;
}

// Recursive function to traverse subdirectories
void recurseDir(ArrayList<File> a, String dir) {
  File file = new File(dir);
  if (file.isDirectory()) {
    // If you want to include directories in the list
    a.add(file);  
    File[] subfiles = file.listFiles();
    for (int i = 0; i < subfiles.length; i++) {
      // Call this function on all files in this directory
      recurseDir(a, subfiles[i].getAbsolutePath());
    }
  } 
  else {
    a.add(file);
  }
}
void recurseOnlyDir(ArrayList<File> a, String dir, int rx, int ry,int level) {
  File file = new File(dir);
  if (file.isDirectory()) {
    // If you want to include directories in the list
    a.add(file);  
    File[] subfiles = file.listFiles();
    ArrayList<File> dirs=new ArrayList<File>();
    fill(level*50, 128, 0);
    ellipse(rx, ry, 25-level*4,25-level*4);
    for (int i = 0; i < subfiles.length; i++) {
      if (subfiles[i].isDirectory())
        dirs.add(subfiles[i]);
    }
    int len=dirs.size();
    println(level);
    for (int i = 0; i < len; i++) {
      // Call this function on all files in this directory
      if (dirs.get(i).isDirectory())
      {
        recurseOnlyDir(a, dirs.get(i).getAbsolutePath(), rx+(int)((i-(len-1)/2.0)*(10+(5-level)*20)), ry+20,level+1);
        line(rx, ry, rx+(int)((i-(len-1)/2.0)*(10+(5-level)*20)), ry+20);
      }
    }
    
  }
}

