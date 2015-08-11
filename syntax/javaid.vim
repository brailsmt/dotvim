" Vim syntax file
" Language:     Java Identifier
" Maintainer:   Joris Melchior <jmelchio@home.com>  
" URL:          http://www.fleiner.com/vim/syntax/javaid.vim
" Last Change:  2001 May 2 

" This file is not a standalone script, but needs the 'real' java.vim
" script. It expands it by also highlighting all known java ids of the 
" standard java classes.
"
" To use it download the file and store it in the same directory as the
" java.vim file. Then you need to either define the variable 
" java_highlight_all or the one for the package you want to highlight
" in your vimrc file. For example: if you want to highlight java.io use
"   :let java_highlight_java_io=1

if exists("java_highlight_java_beans") || exists("java_highlight_all")
  "java.beans.*
  syn keyword javaBeansClass     Beans FeatureDescriptor IntroSpector PropertyChangeSupport
  syn keyword javaBeansClass  PropertyEditorSupport SimpleBeanInfo VetoableChangeSupport
  syn keyword javaBeansClass  BeanDescriptor EvenSetDescriptor MethodDescriptor
  syn keyword javaBeansClass  ParameterDescriptor PropertyDescriptor IndexedPropertyDescriptor
  syn keyword javaBeansClass  IntrospectionException PropertyVetoException PropertyChangeEvent
  syn keyword javaBeansClass  PropertyEditor BeanInfo Customizer Visibility AppletInitializer
  syn keyword javaBeansClass  DesignMode PropertyChangeListener VetoableChangeListener
  JavaHiLink javaBeansClass                                        javaConstant
  syn cluster javaTop add=javaBeansClass
  syn cluster javaClasses add=javaBeansClass
endif  
if exists("java_highlight_java_beans_beancontext") || exists("java_highlight_all")
  " java.beans.beancontext.* 
  syn keyword javaBeansBeancontextClass  BeanContextChildSupport BeanContextSupport BeanContextEvent
  syn keyword javaBeansBeancontextClass  BeanContextServicesSupport BeanContextMembershipEvent
  syn keyword javaBeansBeancontextClass  BeanContextServiceAvailableEvent BeanContextServiceRevokeEvent
  syn keyword javaBeansBeancontextClass  BeanContextMembershipListener BeanContextServiceRevokeListener
  syn keyword javaBeansBeancontextClass  BeanContextServiceListener BeanContextServices
  syn keyword javaBeansBeancontextClass  BeanContextChildComponentProxy BeanContextContainerProxy
  syn keyword javaBeansBeancontextClass  BeanContextProxy BeanContextServiceProvider BeanContextChild
  syn keyword javaBeansBeancontextClass  BeanContext BeanContextServiceProviderBeanInfo
  JavaHiLink javaBeansBeancontextClass                     javaConstant
  syn cluster javaTop add=javaBeansBeancontextClass
  syn cluster javaClasses add=javaBeansBeancontextClass
endif
if exists("java_highlight_java_io") || exists("java_highlight_all")
  " java.io.*
  syn keyword javaIoClass  InputStream File FilenameFilter FileDescriptor RandomAccessFile
  syn keyword javaIoClass  FileFilter OutputStream ObjectStreamClass ObjectStreamField
  syn keyword javaIoClass  StreamTokenizer Reader Writer Serializable Externalizable
  syn keyword javaIoClass  ByteArrayInputStream FileInputStream FilterInputStream
  syn keyword javaIoClass  ObjectInputStream PipedInputStream SequenceInputStream
  syn keyword javaIoClass  StringBufferInputStream ByteArrayOutputStream FileOutputStream
  syn keyword javaIoClass  FilterOutputStream ObjectOutputStream PipedOutputStream
  syn keyword javaIoClass  BufferedReader InputStreamReader FilterReader CharArrayReader
  syn keyword javaIoClass  PipedReader StringReader ObjectStreamConstants 
  syn keyword javaIoClass  ObjectInputValidation FilePermission SerializablePermission
  syn keyword javaIoClass  BufferedInputStream DataInputStream LineNumberInputStream
  syn keyword javaIoClass  PushbackInputStream DataInput ObjectInput DataOutput
  syn keyword javaIoClass  ObjectOutput BufferedOutputStream DataOutputStream
  syn keyword javaIoClass  PrintStream LineNumberReader FileReader PushbackReader
  syn keyword javaIoClass  BufferedWriter CharArrayWriter FilterWriter OutputStreamWriter
  syn keyword javaIoClass  FileWriter PipedWriter PrintWriter StringWriter IOException
  syn keyword javaIoClass  CharConversionException EOFException FileNotFoundException
  syn keyword javaIoClass  InterruptedIOException ObjectStreamException 
  syn keyword javaIoClass  SyncFailedException UnsupportedEncodingException
  syn keyword javaIoClass  UTFDataFormatException InvalidClassException InvalidObjectException
  syn keyword javaIoClass  NotActiveException NotSerializableException OptionalDataException
  syn keyword javaIoClass  StreamCorruptedException WriteAbortedException JavaHiLink javaIoClass javaConstant
  syn cluster javaTop add=javaIoClass
  syn cluster javaClasses add=javaIoClass
endif  
if exists("java_highlight_java_lang_ref") || exists("java_highlight_all")
  " java.lang.ref.* 
  syn keyword javaLangRefClass  Reference ReferenceQueue PhantomReference SoftReference
  syn keyword javaLangRefClass  WeakReference
  JavaHiLink javaLangRefClass                      javaConstant
  syn cluster javaTop add=javaLangRefClass
  syn cluster javaClasses add=javaLangRefClass
endif  
if exists("java_highlight_java_lang_reflect") || exists("java_highlight_all")
  " java.lang.reflect.*
  syn keyword javaLangReflectClass  AccessibleObject Array Modifier Proxy IvocationTargetException
  syn keyword javaLangReflectClass  UndeclaredThrowableException ReflectPermission Constructor
  syn keyword javaLangReflectClass  Field Method Member InvocationHandler
  JavaHiLink javaLangReflectClass          javaConstant
  syn cluster javaTop add=javaLangReflectClass
  syn cluster javaClasses add=javaLangReflectClass
endif  
if exists("java_highlight_java_lang_math") || exists("java_highlight_all")
  " java.lang.math.*
  syn keyword javaLangMathClass  BigDecimal BigInteger
  JavaHiLink javaLangMathClass                     javaConstant
  syn cluster javaTop add=javaLangMathClass
  syn cluster javaClasses add=javaLangMathClass
endif  
if exists("java_highlight_java_net") || exists("java_highlight_all")
  " java.net.*
  syn keyword javaNetClass  Authenticator ContentHandler DatagramPacket DatagramSocket
  syn keyword javaNetClass  DatagramSocketImpl InetAddress PasswordAuthentication
  syn keyword javaNetClass  ServerSocket Socket SocketImpl URL URLConnection URLDecoder
  syn keyword javaNetClass  URLEncoder URLStreamHandler URLClassLoader SocketPermission
  syn keyword javaNetClass  NetPermission MulticastSocket HttpURLConnection 
  syn keyword javaNetClass  JarURLConnection ContentHandlerFactory SocketImplFactory
  syn keyword javaNetClass  URLStreamHandlerFactory FileNameMap SocketOptions
  syn keyword javaNetClass  DatagramSocketImplFactory MalformedURLException
  syn keyword javaNetClass  ProtocolException SocketException UnknownHostException
  syn keyword javaNetClass  UnknownServiceException BindException ConnectException
  syn keyword javaNetClass  NoRouteToHostException
  JavaHiLink javaNetClass                          javaConstant
  syn cluster javaTop add=javaNetClass
  syn cluster javaClasses add=javaNetClass
endif  
if exists("java_highlight_java_security") || exists("java_highlight_all")
  " java.security.*
  syn keyword javaSecurityClass  AccessControlContext AccessController CodeSource Permission
  syn keyword javaSecurityClass  PermissionCollection Policy ProtectionDomain SecureClassLoader
  syn keyword javaSecurityClass  AllPermission BasicPermission UnresolvedPermission Permissions
  syn keyword javaSecurityClass  DomainCombiner Guard SecurityPermission PrivilegedAction
  syn keyword javaSecurityClass  PrivilegedExceptionAction
  JavaHiLink javaSecurityClass                     javaConstant
  syn cluster javaTop add=javaSecurityClass
  syn cluster javaClasses add=javaSecurityClass
endif  
if exists("java_highlight_java_security_acl") || exists("java_highlight_all")
  " java.security.acl.*
  syn keyword javaSecurityAclClass  Group AclEntry AclNotFoundException LastOwnerException
  syn keyword javaSecurityAclClass  NotOwnerException Owner Permission Acl
  JavaHiLink javaSecurityAclClass          javaConstant
  syn cluster javaTop add=javaSecurityAclClass
  syn cluster javaClasses add=javaSecurityAclClass
endif  
if exists("java_highlight_java_security_cert") || exists("java_highlight_all")
  " java.security.cert.*
  syn keyword javaSecurityCertClass  Certificate CertificateFactory CertificateFactorySpi
  syn keyword javaSecurityCertClass  CRL X509Entry CertificateException CRLException X509Certificate
  syn keyword javaSecurityCertClass  X509CRL CertificateEncodingException CertificateExpiredException
  syn keyword javaSecurityCertClass  CertificateNotYetValidException CertificateParsingException
  JavaHiLink javaSecurityCertClass         javaConstant
  syn cluster javaTop add=javaSecurityCertClass
  syn cluster javaClasses add=javaSecurityCertClass
endif  
if exists("java_highlight_java_security_interfaces") || exists("java_highlight_all")
  " java.security.interfaces.*
  syn keyword javaSecurityInterfacesClass  DSAKey RSAKey DSAPrivateKey DSAPublicKey RSAPublicKey
  syn keyword javaSecurityInterfacesClass  RSAPrivateKey DSAKeyPairGenerator DSAParams RSAPrivateCrtKey
  JavaHiLink javaSecurityInterfacesClass   javaConstant
  syn cluster javaTop add=javaSecurityInterfacesClass
  syn cluster javaClasses add=javaSecurityInterfacesClass
endif  
if exists("java_highlight_java_security_spec") || exists("java_highlight_all")
  " java.security.spec.*
  syn keyword javaSecuritySpecClass  DSAParameterSpec DSAPrivateKeySpec DSAPublicKeySpec EncodeKeySpec
  syn keyword javaSecuritySpecClass  RSAKeyGenParameterSpec RSAPrivateKeySpec InvalidKeySpecException
  syn keyword javaSecuritySpecClass  InvalidParameterSpecException PKCS8EncodedKeySpec
  syn keyword javaSecuritySpecClass  X509EncodedKeySpec RSAPrivateKeySpec AlgorithmParameterSpec
  syn keyword javaSecuritySpecClass KeySpec JavaHiLink javaSecuritySpecClass javaConstant
  syn cluster javaTop add=javaSecuritySpecClass
  syn cluster javaClasses add=javaSecuritySpecClass
endif  
if exists("java_highlight_java_text") || exists("java_highlight_all")
  " java.text.*
  syn keyword javaTextClass  Annotation AttributeString BreakIterator DateFormatSymbols
  syn keyword javaTextClass  DecimalFormatSymbols Format CollationKey CollationElementIterator
  syn keyword javaTextClass  Collator FieldPosition ParsePosition ParseException
  syn keyword javaTextClass  CharacterIterator DateFormat MessageFormat NumberFormat
  syn keyword javaTextClass  RuleBasedCollator StringCharacterIterator DecimalFormat
  syn keyword javaTextClass  AttributedCharacterIterator SimpleDateFormat ChoiceFormat
  JavaHiLink javaTextClass                         javaConstant
  syn cluster javaTop add=javaTextClass
  syn cluster javaClasses add=javaTextClass
endif  
if exists("java_highlight_java_util") || exists("java_highlight_all")
  " java.util.*
  syn keyword javaUtilClass  Arrays Collections AbstractCollection Collection AbstractMap
  syn keyword javaUtilClass  Map Dictionary AbstractList AbstractSet List Set HashMap
  syn keyword javaUtilClass  TreeMap WeakHashMap SorteMap Hashtable AbstractSequentialList
  syn keyword javaUtilClass  ArrayList Vector HashSet TreeSet SortedSet Iterator Properties
  syn keyword javaUtilClass  LinkedList Stack Comparator ListIterator BitSet Calendar
  syn keyword javaUtilClass  Date EventObject Locale Observable Random ResouceBundle
  syn keyword javaUtilClass  StringTokenizer TimeZone Timer TimerTask TooManyListenersException
  syn keyword javaUtilClass  ConcurrentModificationException EmptyStackException 
  syn keyword javaUtilClass  MissingResourceException NoSuchElementException PropertyPermission
  syn keyword javaUtilClass  GregorianCalendar ListResourceBundle PropertyResouceBundle
  syn keyword javaUtilClass  SimpleTimeZone EventListener Observer Enumeration JavaHiLink javaUtilClass javaConstant
  syn cluster javaTop add=javaUtilClass
  syn cluster javaClasses add=javaUtilClass
endif  
if exists("java_highlight_java_util_jar") || exists("java_highlight_all")
  " java.util.jar.*
  syn keyword javaUtilJarClass  Attributes Manifest JarEntry JarFile JarInputStream 
  syn keyword javaUtilJarClass  JarOutputStream JarException
  JavaHiLink javaUtilJarClass                      javaConstant
  syn cluster javaTop add=javaUtilJarClass
  syn cluster javaClasses add=javaUtilJarClass
endif  
if exists("java_highlight_java_util_zip") || exists("java_highlight_all")
  " java.util.zip.*
  syn keyword javaUtilZipClass  DataFormatException ZipException CheckedInputStream
  syn keyword javaUtilZipClass  InflaterInputStream CheckedOutputStream DeflaterOutputStream
  syn keyword javaUtilZipClass  Adler32 CRC32 Deflater Inflater ZipEntry ZipFile GZIPInputStream
  syn keyword javaUtilZipClass  ZipInputStream GZIPOutputStream ZipOutputStream CheckSum
  JavaHiLink javaUtilZipClass                      javaConstant
  syn cluster javaTop add=javaUtilZipClass
  syn cluster javaClasses add=javaUtilZipClass
endif  
if exists("java_highlight_javax_crypto") || exists("java_highlight_all")
  " javax.crypto.*
  syn keyword javaxCryptoClass  Cipher CipherSpi KeyAgreement KeyAgreementSpi KeyGenerator
  syn keyword javaxCryptoClass  KeyGeneratorSpi Mac MacSpi SealedObject SecretKeyFactory
  syn keyword javaxCryptoClass  SecretKeyFactorySpi CipherOutputStream SecretKey 
  syn keyword javaxCryptoClass  BadPaddingException IllegalBlockSizeException NoSuchPaddingException
  syn keyword javaxCryptoClass  ShortBufferException NullCipher
  JavaHiLink javaxCryptoClass                      javaConstant
  syn cluster javaTop add=javaxCryptoClass
  syn cluster javaClasses add=javaxCryptoClass
endif  
if exists("java_highlight_java_awt") || exists("java_highlight_all")
  " java.awt.*
  syn keyword javaAwtClass  AlpahCompsite BasicStroke Color GradientPaint TexturePaint
  syn keyword javaAwtClass  Insets RenderingHints CompositeOrientation Cursor Font    
  syn keyword javaAwtClass  FontMetrics Graphics GraphicsConfigTemplate Image PrintJob    
  syn keyword javaAwtClass  MediaTracker Toolkit Polygon Dimension Point Rectangle    
  syn keyword javaAwtClass  SystemColor Transparency Graphics2D Composite Stroke Paint    
  syn keyword javaAwtClass  CompositeContext PaintContext PrintGraphics Shape    
  syn keyword javaAwtClass  CheckboxGroup Component MenuComponent MenuShortcut FlowLayout    
  syn keyword javaAwtClass  GridLayout GridBagConstraints BorderLayout CardLayout    
  syn keyword javaAwtClass  GribBagLayout Checkbox Choice List Button Canvas Containter   
  syn keyword javaAwtClass  Label Scrollbar TextComponent MenuBar MenuItem Panel    
  syn keyword javaAwtClass  ScrollPane Window TextArea TextField Menu CheckboxMenuItem    
  syn keyword javaAwtClass  ItemSelectable Dialog FileDialog Frame Adjustable     
  syn keyword javaAwtClass  MenuContainer PopupMenu LayoutManager LayoutManager2    
  syn keyword javaAwtClass  AWTEvent AWTEventMulticaster Event EventQueue AWTError    
  syn keyword javaAwtClass  AWTException IllegalComponentStateException ActiveEvent    
  syn keyword javaAwtClass  AWTPermission GraphicsEnvironment
  JavaHiLink javaAwtClass                          javaConstant
  syn cluster javaTop add=javaAwtClass
  syn cluster javaClasses add=javaAwtClass
endif  
if exists("java_highlight_java_awt_color") || exists("java_highlight_all")
  " java.awt.color.*
  syn keyword javaAwtColorClass  ColorSpace ICC_Profile CMMException ProfileDataException    
  syn keyword javaAwtColorClass  ICC_ColorSpace ICC_ProfileGray ICC_ProfileRGB    
  JavaHiLink javaAwtColorClass                     javaConstant
  syn cluster javaTop add=javaAwtColorClass
  syn cluster javaClasses add=javaAwtColorClass
endif  
if exists("java_highlight_java_awt_datatransfer") || exists("java_highlight_all")
  " java.awt.datatransfer.*
  syn keyword javaAwtDatatransferClass  Clipboard DataFlavor StringSelection SystemFlavorMap    
  syn keyword javaAwtDatatransferClass  UnsupportedFlavorException ClipboardOwner Transferable    
  syn keyword javaAwtDatatransferClass  FlavorMap
  JavaHiLink javaAwtDatatransferClass      javaConstant
  syn cluster javaTop add=javaAwtDatatransferClass
  syn cluster javaClasses add=javaAwtDatatransferClass
endif  
if exists("java_highlight_java_awt_dnd") || exists("java_highlight_all")
  " java.awt.dnd.*
  syn keyword javaAwtDndClass  DnDConstants DragGestureRecognizer DropTarget DropTargetContext    
  syn keyword javaAwtDndClass  DragSource DragSourceContext DragGestureEvent DragSourceEvent    
  syn keyword javaAwtDndClass  DragTargetEvent DragGestureListener DragSourceListener     
  syn keyword javaAwtDndClass  DropTargetListener MouseDragGestureRecognizer    
  syn keyword javaAwtDndClass  DragSourceDragEvent DragSourceDropEvent DropTargetDragEvent    
  syn keyword javaAwtDndClass  DropTargetDropEvent
  JavaHiLink javaAwtDndClass                       javaConstant
  syn cluster javaTop add=javaAwtDndClass
  syn cluster javaClasses add=javaAwtDndClass
endif  
if exists("java_highlight_java_awt_dnd_peer") || exists("java_highlight_all")
  " java.awt.dnd.peer.*
  syn keyword javaAwtDndPeerClass  DragSourceContextPeer DropTargetContextPeer DropTargetPeer
  JavaHiLink javaAwtDndPeerClass           javaConstant
  syn cluster javaTop add=javaAwtDndPeerClass
  syn cluster javaClasses add=javaAwtDndPeerClass
endif  
if exists("java_highlight_java_awt_event") || exists("java_highlight_all")
  " java.awt.event.*
  syn keyword javaAwtEventClass  ComponentAdapter ContainerAdapter FocusAdapter KeyAdapter
  syn keyword javaAwtEventClass  MouseAdapter MouseMotionAdapter WindowAdapter ActionEvent
  syn keyword javaAwtEventClass  AdjustmentEvent ComponentEvent ItemEvent InputMethodEvent
  syn keyword javaAwtEventClass  InvocationEvent TextEvent ContainerEvent FocusEvent
  syn keyword javaAwtEventClass  InputEvent PaintEvent WindowEvent ActionListener
  syn keyword javaAwtEventClass  AWTEventListener AdjustmentListener ComponentListener
  syn keyword javaAwtEventClass  ContainerListener FocusListener InputMethodListener
  syn keyword javaAwtEventClass  ItemListener KeyListener MouseListener MouseMotionListener
  syn keyword javaAwtEventClass  TextListener WindowListener KeyEvent MouseEvent
  JavaHiLink javaAwtEventClass                     javaConstant
  syn cluster javaTop add=javaAwtEventClass
  syn cluster javaClasses add=javaAwtEventClass
endif  
if exists("java_highlight_java_awt_font") || exists("java_highlight_all")
  " java.awt.font.*
  syn keyword javaAwtFontClass  FontRenderContext GlyphJustificationInfo GlyphMetrics
  syn keyword javaAwtFontClass  GlyphVector GraphicAttribute LineBreakMeasurer LineMetrics
  syn keyword javaAwtFontClass  TextAttribute TextHitInfo TextLayout TransformAttribute
  syn keyword javaAwtFontClass  MultipleMaster OpenType ImageGraphicAttribute 
  syn keyword javaAwtFontClass  ShapeGraphicAttribute
  JavaHiLink javaAwtFontClass                      javaConstant
  syn cluster javaTop add=javaAwtFontClass
  syn cluster javaClasses add=javaAwtFontClass
endif  
if exists("java_highlight_java_awt_geom") || exists("java_highlight_all")
  " java.awt.geom.*
  syn keyword javaAwtGeomClass  AffineTransform Area CubicCurve2D Dimension2D 
  syn keyword javaAwtGeomClass  FlatteningPathIterator GeneralPath Line2D QuadCurve2D
  syn keyword javaAwtGeomClass  Point2D RectangularShape NoninvertibleTransformException
  syn keyword javaAwtGeomClass  IllegalPathStateException Arc2D Ellipse2D Rectangle2D
  syn keyword javaAwtGeomClass  RoundRectangle2D PathIterator
  JavaHiLink javaAwtGeomClass                      javaConstant
  syn cluster javaTop add=javaAwtGeomClass
  syn cluster javaClasses add=javaAwtGeomClass
endif  
if exists("java_highlight_java_awt_im") || exists("java_highlight_all")
  "java.awt.im
  syn keyword javaAwtImClass  InputContext InputMethodHighLight InputSubset 
  syn keyword javaAwtImClass  InputMethodRequests
  JavaHiLink javaAwtImClass                        javaConstant
  syn cluster javaTop add=javaAwtImClass
  syn cluster javaClasses add=javaAwtImClass
endif  
if exists("java_highlight_java_awt_image") || exists("java_highlight_all")
  " java.awt.image
  syn keyword javaAwtImageClass  AffineTransformOp BandCombineOp ColorConvertOp ConvolveOp
  syn keyword javaAwtImageClass  LookupOp RescaleOp ColorModel DataBuffer FilteredImageSource
  syn keyword javaAwtImageClass  MemoryImageSource ImageFilter Kernel PixelGrabber LookupTable
  syn keyword javaAwtImageClass  Raster SampleModel ImageOpException RasterFormatException
  syn keyword javaAwtImageClass  BufferedImage ComponentColorModel IndexColorModel PackedColorModel
  syn keyword javaAwtImageClass  DataBufferByte DataBufferInt BufferedImageFilter CropImageFilter
  syn keyword javaAwtImageClass  ReplicateScaleFilter RGBImageFilter ByteLookupTable 
  syn keyword javaAwtImageClass  ShortLookupTable WritableRaster ComponentSampleModel
  syn keyword javaAwtImageClass  MultiPixelPackedSampleModel SinglePixelPackedSampleModel
  syn keyword javaAwtImageClass  SinglePixelPackedSampleModel RenderedImage BufferedImageOp
  syn keyword javaAwtImageClass  RasterOp TileObserver DirectColorModel DataBufferShort
  syn keyword javaAwtImageClass  DataBufferUShort ImageProducer AreaAveragingScaleFilter
  syn keyword javaAwtImageClass  ImageConsumer ImageObserver BandedSampleModel 
  syn keyword javaAwtImageClass  PixelInterleaveSampleModel WritableRenderedImage
  JavaHiLink javaAwtImageClass                     javaConstant
  syn cluster javaTop add=javaAwtImageClass
  syn cluster javaClasses add=javaAwtImageClass
endif  
if exists("java_highlight_java_awt_image_renderable") || exists("java_highlight_all")
  " java.image.renderable.*
  syn keyword javaAwtImageRenderableClass  ParameterBlock RenerableImageOp RenderableImageProducer
  syn keyword javaAwtImageRenderableClass  RenderableImage RenderedImageFactory ContextualRenderedImageFactory
  JavaHiLink javaAwtImageRenderableClass   javaConstant
  syn cluster javaTop add=javaAwtImageRenderableClass
  syn cluster javaClasses add=javaAwtImageRenderableClass
endif  
if exists("java_highlight_java_awt_peer") || exists("java_highlight_all")
  " java.awt.peer.*
  syn keyword javaAwtPeerClass  ComponentPeer FontPeer MenuComponentPeer ButtonPeer CanvasPeer
  syn keyword javaAwtPeerClass  CheckboxPeer ChoicePeer ContainerPeer LabelPeer LightWeightPeer
  syn keyword javaAwtPeerClass  ListPeer ScrollbarPeer TextComponentPeer MenuBarPeer MenuItemPeer
  syn keyword javaAwtPeerClass  PanelPeer ScrollPanePeer WindowPeer TextAreaPeer TextFieldPeer
  syn keyword javaAwtPeerClass  MenuPeer CheckboxMenuItemPeer DialogPeer FramePeer PopupMenuPeer
  syn keyword javaAwtPeerClass  FileDialogPeer
  JavaHiLink javaAwtPeerClass                              javaConstant
  syn cluster javaTop add=javaAwtPeerClass
  syn cluster javaClasses add=javaAwtPeerClass
endif  
if exists("java_highlight_java_awt_print") || exists("java_highlight_all")
  " java.awt.print
  syn keyword javaAwtPrintClass  Book PageFormat Paper PrinterJob PrinterException Pageable
  syn keyword javaAwtPrintClass  Printable PrinterGraphics PrinterAbortException PrinterIOException
  JavaHiLink javaAwtPrintClass                     javaConstant
  syn cluster javaTop add=javaAwtPrintClass
  syn cluster javaClasses add=javaAwtPrintClass
endif  
if exists("java_highlight_javax_accessibility") || exists("java_highlight_all")
  " javax.accessibility.*
  syn keyword javaxAccessibilityClass  AccessibleBundle AccessibleContext AccessibleHyperLink
  syn keyword javaxAccessibilityClass  AccessibleStateSet AccessibleResourceBundle AccessibleRole
  syn keyword javaxAccessibilityClass  AccessibleState AccessibleText Accessible AccessibleAction
  syn keyword javaxAccessibilityClass  AccessibleComponent AccessibleSelection AccessibleHyperText
  syn keyword javaxAccessibilityClass  AccessibleValue
  JavaHiLink javaxAccessibilityClass       javaConstant
  syn cluster javaTop add=javaxAccessibilityClass
  syn cluster javaClasses add=javaxAccessibilityClass
endif  
if exists("java_highlight_javax_swing") || exists("java_highlight_all")
  " javax.swing.*
  syn keyword javaxSwingClass  Box CellRenderPane JComponent JDialog JFrame JWindow
  syn keyword javaxSwingClass  RootPaneContainer WindowConstants JApplet SwingConstants
  syn keyword javaxSwingClass  ScrollPaneConstants JEditorPane JTextArea JTextField
  syn keyword javaxSwingClass  AbstractButton JColorChooser JComboBox JInternalFrame
  syn keyword javaxSwingClass  JLabel JLayeredPane JToolTip JOptionPane JPopupMenu JRootPane
  syn keyword javaxSwingClass  JScrollPane JSlider JTabbedPane JToolBar JTree JTextPane
  syn keyword javaxSwingClass  JPasswordField JButton JMenuItem JToggleButton JFileChooser
  syn keyword javaxSwingClass  DefaultListCellRenderer JDesktopPane JMenuBar JPanel
  syn keyword javaxSwingClass  JProgressBar JScrollBar JSeparator JSplitPane JTable JList
  syn keyword javaxSwingClass  JViewport Scrollable JCheckBoxMenuItem JMenu JRadioButtonMenuItem
  syn keyword javaxSwingClass  JCheckBox JRadioButton ListCellRenderer MenuElement
  syn keyword javaxSwingClass  AbstractListModel DefaultBoundedRangeModel DefaultButtonModel
  syn keyword javaxSwingClass  DefaultListSelectionModel DefaultSingleSelectionModel ListModel
  syn keyword javaxSwingClass  ScrollPaneLayout ViewportLayout BoxLayout OverlayLayout
  syn keyword javaxSwingClass  DefaultComboBoxModel DefaultListModel BoundedRangeModel
  syn keyword javaxSwingClass  ListSelectionModel SingelSelectionModel CombBoxModel
  syn keyword javaxSwingClass  MutableComboBoxModel ButtonModel AbstractAction ButtonGroup
  syn keyword javaxSwingClass  FocusManager ImageIcon LookAndFeel ProgressMonitor 
  syn keyword javaxSwingClass  SizeRequirements Timer DefaultCellEditor 
  syn keyword javaxSwingClass  UnsupportedLookAndFeelException ProgressMonitorInputStream
  syn keyword javaxSwingClass  UIDefaults DebugGraphics GrayFilter BorderFactory
  syn keyword javaxSwingClass  DefaultDesktopManager DefaultFocusManager KeyStroke
  syn keyword javaxSwingClass  MenuSelectionManager RepaintManager SwingUtilities UIManager
  syn keyword javaxSwingClass  CellEditor Action ComboBoxEditor DesktopManager Icon Renderer
  syn keyword javaxSwingClass  SwingConstants
  JavaHiLink javaxSwingClass                       javaConstant
  syn cluster javaTop add=javaxSwingClass
  syn cluster javaClasses add=javaxSwingClass
endif  
if exists("java_highlight_javax_swing_border") || exists("java_highlight_all")
  " javax.swing.border.*
  syn keyword javaxSwingBorderClass  AbstractBorder Border BevelBroder CompoundBorder EmptyBorder
  syn keyword javaxSwingBorderClass  EtchedBorder LineBorder TitleBorder SoftBevelBorder MatteBorder
  JavaHiLink javaxSwingBorderClass         javaConstant
  syn cluster javaTop add=javaxSwingBorderClass
  syn cluster javaClasses add=javaxSwingBorderClass
endif  
if exists("java_highlight_javax_swing_colorchooser") || exists("java_highlight_all")
  " javax.swing.colorchooser.*
  syn keyword javaxSwingColorchooserClass  ColorChooserComponentFactory DefaultColorSelectionModel
  syn keyword javaxSwingColorchooserClass  AbstractColorChooserPanel ColorSelectionModel
  JavaHiLink javaxSwingColorchooserClass   javaConstant
  syn cluster javaTop add=javaxSwingColorchooserClass
  syn cluster javaClasses add=javaxSwingColorchooserClass
endif  
if exists("java_highlight_javax_swing_event") || exists("java_highlight_all")
  " javax.swing.event.*
  syn keyword javaxSwingEventClass  EventListenerList CaretEvent ListDataEvent TabelColumnModelEvent
  syn keyword javaxSwingEventClass  EventListenerList AncestorEvent MenuDragMouseEvent
  syn keyword javaxSwingEventClass  SwingPropertyChangeSupport InternalFrameAdapter ChangeEvent
  syn keyword javaxSwingEventClass  MenuEvent TableModelEvent InternalFrameEvent MenuKeyEvent
  syn keyword javaxSwingEventClass  MouseInputAdapter HyperlinkEvent PopupMenuEvent TreeExpansionEvent
  syn keyword javaxSwingEventClass  AncestorEvent CaretListener CellEditorListener ChangeLister
  syn keyword javaxSwingEventClass  DocumentListener HyperlinkListener InternalFrameListener
  syn keyword javaxSwingEventClass  ListDateListener ListSelectionListener MenuDragMouseListener
  syn keyword javaxSwingEventClass  MenuKeyListener MenuListener MouseInputListener PopupMenuListener
  syn keyword javaxSwingEventClass  TableColumnModelListener TableModelListener TreeExpansionListener
  syn keyword javaxSwingEventClass  TreeModelListener TreeSelectionListener TreeWillExpandListener
  syn keyword javaxSwingEventClass  UndoableEditListener
  JavaHiLink javaxSwingEventClass                  javaConstant
  syn cluster javaTop add=javaxSwingEventClass
  syn cluster javaClasses add=javaxSwingEventClass
endif  
if exists("java_highlight_javax_swing_filechooser") || exists("java_highlight_all")
  " javax.swing.filechooser.*
  syn keyword javaxSwingFilechooserClass  FileFilter FileSystemView FileView
  JavaHiLink javaxSwingFilechooserClass    javaConstant
  syn cluster javaTop add=javaxSwingFilechooserClass
  syn cluster javaClasses add=javaxSwingFilechooserClass
endif  
if exists("java_highlight_javax_swing_plaf") || exists("java_highlight_all")
  " javax.swing.plaf.*
  syn keyword javaxSwingPlafClass  ComponentUI BorderUIResource IconUIResource ColorUIResource
  syn keyword javaxSwingPlafClass  DimensionUIResource FontUIResource InsetsUIResource UIResource
  syn keyword javaxSwingPlafClass  ButtonUI ColorChooserUI DesktopIconUI InternalFrameUI ListUI
  syn keyword javaxSwingPlafClass  OptionPaneUI PopupMenuUI ScrollBarUI SeparatorUI SplitPaneUI
  syn keyword javaxSwingPlafClass  TableHeaderUI TextUI ToolTipUI ViewportUI MenuItemUI ComboBoxUI
  syn keyword javaxSwingPlafClass  FileChooserUI LabelUI MenuBarUI PanelUI ProgressBarUI ScrollPaneUI
  syn keyword javaxSwingPlafClass  SliderUI TabbedPaneUI TabelUI ToolbarUI TreeUI
  JavaHiLink javaxSwingPlafClass                   javaConstant
  syn cluster javaTop add=javaxSwingPlafClass
  syn cluster javaClasses add=javaxSwingPlafClass
endif  
if exists("java_highlight_javax_swing_table") || exists("java_highlight_all")
  " javax.swing.table.*
  syn keyword javaxSwingTableClass  AbstractTableModel DefaultTableColumnModel TableColumn JTableHeader
  syn keyword javaxSwingTableClass  DefaultTableModel TableModel TableColumnModel TableCellRenderer
  syn keyword javaxSwingTableClass  TableCelEditor
  JavaHiLink javaxSwingTableClass                  javaConstant
  syn cluster javaTop add=javaxSwingTableClass
  syn cluster javaClasses add=javaxSwingTableClass
endif  
if exists("java_highlight_javax_swing_text") || exists("java_highlight_all")
  " javax.swing.text.*
  syn keyword javaxSwingTextClass  AbstractDocument AbstractWriter EditorKit ElementIterator GapContent
  syn keyword javaxSwingTextClass  LayeredHighlighter Segment SimpleAttributeSet StyleContext TabSet
  syn keyword javaxSwingTextClass  TabStop Utilities View BadLocationException ChangedCharSetException
  syn keyword javaxSwingTextClass  JTextComponent TextAction DefaultCaret DefaultStyledDocument 
  syn keyword javaxSwingTextClass  PlainDocument DefaultEditorKit DefaultLayeredHighlighter
  syn keyword javaxSwingTextClass  AttributeSet ComponentView CompositeView IconView LabelView
  syn keyword javaxSwingTextClass  PlainView StyledEditorKit MutableAttributeSet BoxView FieldView
  syn keyword javaxSwingTextClass  Document StyledDocument Element Keymap ViewFactory Highlighter
  syn keyword javaxSwingTextClass  Style Position TabableView TabExpander ParagraphView TableView
  syn keyword javaxSwingTextClass  WrappedPlainView PasswordView Caret
  JavaHiLink javaxSwingTextClass                   javaConstant
  syn cluster javaTop add=javaxSwingTextClass
  syn cluster javaClasses add=javaxSwingTextClass
endif  
if exists("java_highlight_javax_swing_text_html") || exists("java_highlight_all")
  " javax.swing.text.html.*
  syn keyword javaxSwingTextHtmlClass  CSS HTML Option BlockView FormView ObjectView InlineView
  syn keyword javaxSwingTextHtmlClass  ParagraphView HTMLDocument HTMLEditorKit HTMLWriter
  syn keyword javaxSwingTextHtmlClass  MinimalHTMLWriter StyleSheet HTMLFrameHyperlinkEvent ListView
  JavaHiLink javaxSwingTextHtmlClass               javaConstant
  syn cluster javaTop add=javaxSwingTextHtmlClass
  syn cluster javaClasses add=javaxSwingTextHtmlClass
endif  
if exists("java_highlight_javax_swing_text_html_parser") || exists("java_highlight_all")
  " javax.swing.text.html.parser.*
  syn keyword javaxSwingTextHtmlParserClass  AttributeList ContentModel DTD Element Entity Parser TagElement
  syn keyword javaxSwingTextHtmlParserClass  ParserDelegate DTDConstants DocumentParser
  JavaHiLink javaxSwingTextHtmlParserClass javaConstant
  syn cluster javaTop add=javaxSwingTextHtmlParserClass
  syn cluster javaClasses add=javaxSwingTextHtmlParserClass
endif  
if exists("java_highlight_javax_swing_text_rtf") || exists("java_highlight_all")
  " javax.swing.text.rtf.*
  syn keyword javaxSwingTextRtfClass  RTFEditorKit
  JavaHiLink javaxSwingTextRtfClass                javaConstant
  syn cluster javaTop add=javaxSwingTextRtfClass
  syn cluster javaClasses add=javaxSwingTextRtfClass
endif  
if exists("java_highlight_javax_swing_tree") || exists("java_highlight_all")
  " javax.swing.tree.*
  syn keyword javaxSwingTreeClass  AbstractLayoutCache DefaultMutableTreeNode DefaultTreeCellEditor
  syn keyword javaxSwingTreeClass  DefaultTreeModel DefaultTreeSelectionModel TreePath 
  syn keyword javaxSwingTreeClass  ExpandVetoException DefaultTreeCellRenderer FixedHeightLayoutCache
  syn keyword javaxSwingTreeClass  VariableHeightLayoutCache TreeNode RowMapper MutableTreeNode
  syn keyword javaxSwingTreeClass  TreeModel TreeSelectionModel TreeCellRenderer TreeCellEditor
  JavaHiLink javaxSwingTreeClass                   javaConstant
  syn cluster javaTop add=javaxSwingTreeClass
  syn cluster javaClasses add=javaxSwingTreeClass
endif  
if exists("java_highlight_javax_swing_undo") || exists("java_highlight_all")
  " javax.swing.undo.*
  syn keyword javaxSwingUndoClass  AbstractUnodableUnit UndoableUnitSupport CannotRedoException
  syn keyword javaxSwingUndoClass  CannotUndoException CompoundEdit StateEdit UndoManager
  syn keyword javaxSwingUndoClass  StateEditable UndoableEdit
  JavaHiLink javaxSwingUndoClass                   javaConstant
  syn cluster javaTop add=javaxSwingUndoClass
  syn cluster javaClasses add=javaxSwingUndoClass
endif
if exists("java_highlight_java_rmi") || exists("java_highlight_all")
  syn keyword javaRmiClass  AccessException AlreadyBoundException ConnectException
  syn keyword javaRmiClass  ConnectIOException MarshalException MarshalledObject Naming
  syn keyword javaRmiClass  NoSuchObjectException NotBoundException Remote RemoteException
  syn keyword javaRmiClass  RMISecurityException RMISecurityManager ServerError ServerException
  syn keyword javaRmiClass  ServerRuntimeException StubNotFoundException UnexptectedException
  syn keyword javaRmiClass  UnknownHostException UnmarshalException 
  JavaHiLink javaRmiClass  javaConstant
  syn cluster javaTop add=javaRmiClass
  syn cluster javaClasses add=javaRmiClass
endif
if exists("java_highlight_java_rmi_activation") || exists("java_highlight_all")
  syn keyword javaRmiActivationClass  Activatable ActivateFailedException ActivationDesc
  syn keyword javaRmiActivationClass  ActivationException ActivationGroup ActivationGroupDesc
  syn keyword javaRmiActivationClass  CommandEnvironment ActivationGroupID ActivationID
  syn keyword javaRmiActivationClass  ActivationInstantiator ActivationMonitor ActivationSystem
  syn keyword javaRmiActivationClass  Activator UnknownGroupException
  JavaHiLink javaRmiActivationClass        javaConstant
  syn cluster javaTop add=javaRmiActivationClass
  syn cluster javaClasses add=javaRmiActivationClass
endif
if exists("java_highlight_java_rmi_dgc") || exists("java_highlight_all")
  syn keyword javaRmiDgcClass  DGC Lease VMID 
  JavaHiLink javaRmiDgcClass       javaConstant
  syn cluster javaTop add=javaRmiDgcClass
  syn cluster javaClasses add=javaRmiDgcClass
endif
if exists("java_highlight_java_rmi_registry") || exists("java_highlight_all")
  syn keyword javaRmiRegistry  LocateRegistry Registry RegistryHandler 
  JavaHiLink javaRmiRegistry       javaConstant
  syn cluster javaTop add=javaRmiRegistry
  syn cluster javaClasses add=javaRmiRegistry
endif
if exists("java_highlight_java_rmi_server") || exists("java_highlight_all")
  syn keyword javaRmiServerClass ExportException LoaderHandler LogStream ObjID Operation
  syn keyword javaRmiServerClass  RemoteCall RemoteObject RemoteRef RemoteServer RemoteStub
  syn keyword javaRmiServerClass  RMIClassLoader RMIClientSocketFactory RMIFailureHandler
  syn keyword javaRmiServerClass  RMIServerSocketFactory RMISocketFactory ServerCloneException
  syn keyword javaRmiServerClass  ServerNotActiveException ServerRef Skeleton SkeletonMismatchException
  syn keyword javaRmiServerClass  SkeletonNotFoundException SocketSecurityExcpetion UID 
  syn keyword javaRmiServerClass  UnicastRemoteObject Unreferenced
  JavaHiLink javaRmiServerClass            javaConstant
  syn cluster javaTop add=javaRmiServerClass
  syn cluster javaClasses add=javaRmiServerClass
endif
if exists("java_highlight_java_sql") || exists("java_highlight_all")
  syn keyword javaSqlClass  Array BatchUpdateException Blob CallableStatement Clob Connection
  syn keyword javaSqlClass  DatabaseMetaData DataTruncation Date Driver DriverManager DriverPropertyInfo
  syn keyword javaSqlClass  PreparedStatement Ref ResultSet ResultSetMetaData SQLData SQLException
  syn keyword javaSqlClass  SQLInput SQLOutput SQLWarning Statement Struct Time Timestamp Types
  JavaHiLink javaSqlClass          javaConstant
  syn cluster javaTop add=javaSqlClass
  syn cluster javaClasses add=javaSqlClass
endif
if exists("java_highlight_javax_ejb") || exists("java_highlight_all")
  syn keyword javaxEjbClass  CreateException DuplicateKeyException EJBContext EJBException EJBHome
  syn keyword javaxEjbClass  EJBMetaData EJBObject EnterpriseBean EntityBean EntityContext 
  syn keyword javaxEjbClass  FinderException Handle ObjectNotFoundException RemoveException
  syn keyword javaxEjbClass  SessionBean SessionContext SessionSynchronization
  JavaHiLink javaxEjbClass         javaConstant
  syn cluster javaTop add=javaxEjbClass
  syn cluster javaClasses add=javaxEjbClass
endif
if exists("java_highlight_javax_ejb_deployment") || exists("java_highlight_all")
  syn keyword javaxEjbDeploymentClass  AccessControlEntry ControlDescriptor DeploymentDescriptor
  syn keyword javaxEjbDeploymentClass  EntityDescriptor SessionDescriptor
  JavaHiLink javaEjbDeploymentClass                javaConstant
  syn cluster javaTop add=javaEjbDeploymentClass
  syn cluster javaClasses add=javaEjbDeploymentClass
endif
if exists("java_highlight_javax_jms") || exists("java_highlight_all")
  syn keyword javaxJmsClass  BytesMessage Connection ConnectionConsumer ConnectionFactory 
  syn keyword javaxJmsClass  ConnectionMetaData DeliveryMode Destination ExceptionListener
  syn keyword javaxJmsClass  IllegalStateException InvalidClientIDException InvalidDestinationException
  syn keyword javaxJmsClass  InvalidSelectorException JMSException JMSSecurityException MapMessage
  syn keyword javaxJmsClass  Message MessageConsumer MessageEOFException MessageFormatException
  syn keyword javaxJmsClass  MessageListener MessageNotReadableException MessageNotWritableException
  syn keyword javaxJmsClass  MessageProducer ObjectMessage Queue QueueBrowser QueueConnection
  syn keyword javaxJmsClass  QueueConnectionFactory QueueReceiver QueueRequester QueueSession
  syn keyword javaxJmsClass  ResourceAllocationException ServerSession ServerSessionPool Session
  syn keyword javaxJmsClass  StreamMessage TemporaryQueue TemporaryTopic TextMessage Topic
  syn keyword javaxJmsClass  TopicConnection TopicConnectionFactory TopicPublisher TopicRequester
  syn keyword javaxJmsClass  TopicSession TopicSubscriber TransactionInProgressException
  syn keyword javaxJmsClass  TransactionRolledBackException XAConnection XAConnectionFactory
  syn keyword javaxJmsClass  XAQueueConnection XAQueueConnectionFactory XAQueueSession
  syn keyword javaxJmsClass  XASession XATopicConnection XATopicConnectionFactory XATopicSession
  JavaHiLink javaxJmsClass         javaConstant
  syn cluster javaTop add=javaxJmsClass
  syn cluster javaClasses add=javaxJmsClass
endif
if exists("java_highlight_javax_naming") || exists("java_highlight_all")
  syn keyword javaxNamingClass  AuthenticationException AuthenticationNotSupportedException
  syn keyword javaxNamingClass  BinaryRefAddr Binding CannotProceedException CommunicationException
  syn keyword javaxNamingClass  CommunicationException CompositeName CompoundName ConfigurationException
  syn keyword javaxNamingClass  Context ContextNotEmptyException InitialContext 
  syn keyword javaxNamingClass  InsufficientResourcesException InterruptedNamingException 
  syn keyword javaxNamingClass  InvalidNameException LimitExceededException LinkException
  syn keyword javaxNamingClass  LinkLoopException LinkRef MalformedLinkException Name 
  syn keyword javaxNamingClass  NameAlreadyBoundException NameClassPair NameNotFoundException
  syn keyword javaxNamingClass  NameParser NamingEnumeration NamingException NamingSecurityException
  syn keyword javaxNamingClass  NoInitialContextException NoPermissionException NotContextException
  syn keyword javaxNamingClass  OperationNotSupportedException PartialResultException RefAddr 
  syn keyword javaxNamingClass  Reference ReferralException ServiceUnavailableException
  syn keyword javaxNamingClass  SizeLimitExceededException StringRefAddr TimeLimitExceededException
  JavaHiLink javaxNamingClass              javaConstant
  syn cluster javaTop add=javaxNamingClass
  syn cluster javaClasses add=javaxNamingClass
endif
if exists("java_highlight_javax_naming_directory") || exists("java_highlight_all")
  syn keyword javaxNamingDirectoryClass  Attribute AttributeInUseException AttributeModificationException
  syn keyword javaxNamingDirectoryClass  Attributes BasicAttribute BasicAttributes DirContext
  syn keyword javaxNamingDirectoryClass  InitialDirContext InvalidAttributeIdentifierException
  syn keyword javaxNamingDirectoryClass  InvalidAttributesException InvalidAttributeValueException
  syn keyword javaxNamingDirectoryClass  InvalidSearchControlsException InvalidSearchFilterException
  syn keyword javaxNamingDirectoryClass  ModificationItem NoSuchAttributeException SchemeViolationException
  syn keyword javaxNamingDirectoryClass  SearchControls SearchResult
  JavaHiLink javaxNamingDirectoryClass             javaConstant
  syn cluster javaTop add=javaxNamingDirectoryClass
  syn cluster javaClasses add=javaxNamingDirectoryClass
endif
if exists("java_highlight_javax_naming_spi") || exists("java_highlight_all")
  syn keyword javaxNamingSpiClass  DirectoryManager InitialContextFactory InitialContextFactoryBuilder
  syn keyword javaxNamingSpiClass  NamingManager ObjectFactory ObjectFactoryBuilder Resolver ResolveResult
  JavaHiLink javaxNamingSpiClass           javaConstant
  syn cluster javaTop add=javaxNamingSpiClass
  syn cluster javaClasses add=javaxNamingSpiClass
endif
if exists("java_highlight_javax_servlet") || exists("java_highlight_all")
  syn keyword javaxServletClass  GenericServlet RequestDispatcher Servlet ServletConfig ServletContext
  syn keyword javaxServletClass  ServletException ServletInputStream ServletOutputStream ServletRequest
  syn keyword javaxServletClass  ServletResponse SingleThreadModel UnavailableException
  JavaHiLink javaxServletClass             javaConstant
  syn cluster javaTop add=javaxServletClass
  syn cluster javaClasses add=javaxServletClass
endif
if exists("java_highlight_javax_servlet_http") || exists("java_highlight_all")
  syn keyword javaxServletHttpClass  Cookie HttpServlet HttpServletRequest HttpServletResponse 
  syn keyword javaxServletHttpClass  HttpSession HttpSessionBindingEvent HttpSessionBindingListener
  syn keyword javaxServletHttpClass  HttpSessionContext HttpUtils
  JavaHiLink javaxServletHttpClass         javaConstant
  syn cluster javaTop add=javaxServletHttpClass
  syn cluster javaClasses add=javaxServletHttpClass
endif
if exists("java_highlight_javax_sql") || exists("java_highlight_all")
  syn keyword javaxSqlClass  ConnectionEvent ConnectionEventListener ConnectionPoolDataSource
  syn keyword javaxSqlClass  DataSource PooledConnection RowSet RowSetEvent RowSetInternal
  syn keyword javaxSqlClass  RowSetListener RowSetMetaData RowSetReader RowSetWriter
  syn keyword javaxSqlClass  XAConnection XADataSource
  JavaHiLink javaxSqlClass         javaConstant
  syn cluster javaTop add=javaxSqlClass
  syn cluster javaClasses add=javaxSqlClass
endif
if exists("java_highlight_javax_transaction") || exists("java_highlight_all")
  syn keyword javaxTransactionClass  HeuristicCommitException HeuristicMixedException 
  syn keyword javaxTransactionClass  HeuristicRollbackException InvalidTransactionException
  syn keyword javaxTransactionClass  NotSupportedException RollbackException Status Synchronization
  syn keyword javaxTransactionClass  SystemException Transaction TransactionManager
  syn keyword javaxTransactionClass  TransactionRequiredException TransactionRolledbackException
  syn keyword javaxTransactionClass  UserTransaction
  JavaHiLink javaxTransactionClass         javaConstant
  syn cluster javaTop add=javaxTransactionClass
  syn cluster javaClasses add=javaxTransactionClass
endif
if exists("java_highlight_javax_transaction_xa") || exists("java_highlight_all")
  syn keyword javaxTransactionXaClass  XAException XAResource Xid
  JavaHiLink javaxTransactionXaClass               javaConstant
  syn cluster javaTop add=javaxTransactionXaClass
  syn cluster javaClasses add=javaxTransactionXaClass
endif
if exists("java_highlight_org_omg_corba") || exists("java_highlight_all")
  syn keyword orgOmgCorbaClass  Any AnyHolder ARG_IN ARG_INOUT ARG_OUT BAD_CONTEXT BAD_INV_ORDER
  syn keyword orgOmgCorbaClass  BAD_OPERATION BAD_PARAM BAD_TYPECODE BooleanHolder Bounds ByteHolder
  syn keyword orgOmgCorbaClass  CharHolder COMM_FAILURE CompletionStatus Context ContextList 
  syn keyword orgOmgCorbaClass  CTX_RESTRICT_SCOPE Current DATA_CONVERSION DefinitionKind DomainManager
  syn keyword orgOmgCorbaClass  DoubleHolder DynamicImplementation DynAny DynArray DynEnum DynFixed
  syn keyword orgOmgCorbaClass  DynSequence DynStruct DynUnion DynValue Environment ExceptionList
  syn keyword orgOmgCorbaClass  FixedHolder FloatHolder FREE_MEM IDLType IMP_LIMIT INITIALIZE INTERNAL
  syn keyword orgOmgCorbaClass  INTF_REPOS IntHolder INV_FLAG INV_IDENT INV_OBJREF INV_POLICY 
  syn keyword orgOmgCorbaClass  INVALID_TRANSACTION IRObject LongHolder MARSHAL NamedValue 
  syn keyword orgOmgCorbaClass  NameValuePair NO_IMPLEMENT NO_MEMORY NO_PERMISSION NO_RESOURCES
  syn keyword orgOmgCorbaClass  NO_RESPONSE NVList OBJ_ADAPTER Object OBJECT_NOT_EXIST ObjectHolder
  syn keyword orgOmgCorbaClass  ORB PERSIST_STORE Policy PolicyError Principal PrincipalHolder 
  syn keyword orgOmgCorbaClass  Request ServerRequest ServiceDetail ServiceDetailHelper ServiceInformation
  syn keyword orgOmgCorbaClass  ServiceInformationHelper ServiceInformationHolder SetOverrideType
  syn keyword orgOmgCorbaClass  ShortHolder StringHolder StructMember SystemException TCKind
  syn keyword orgOmgCorbaClass  TRANSACTION_REQUIRED TRANSACTION_ROLLEDBACK TRANSIENT TypeCode 
  syn keyword orgOmgCorbaClass  TypeCodeHolder UnionMember UNKNOWN UnknownUserException UserException
  syn keyword orgOmgCorbaClass  ValueMember WrongTransaction
  JavaHiLink orgOmgCorbaClass              javaConstant
  syn cluster javaTop add=orgOmgCorbaClass
  syn cluster javaClasses add=orgOmgCorbaClass
endif
if exists("java_highlight_org_omg_corba_dynanypackage") || exists("java_highlight_all")
  syn keyword orgOmgCorbaDynanypackageClass  Invalid InvalidSeq InvalidValue TypeMismatch 
  JavaHiLink orgOmgCorbaDynanypackageClass         javaConstant
  syn cluster javaTop add=orgOmgCorbaDynanypackageClass
  syn cluster javaClasses add=orgOmgCorbaDynanypackageClass
endif
if exists("java_highlight_org_omg_corba_orbpackage") || exists("java_highlight_all")
  syn keyword orgOmgCorbaOrbpackage  InconsistentTypeCode InvalidName
  JavaHiLink orgOmgCorbaOrbpackage         javaConstant
  syn cluster javaTop add=orgOmgCorbaOrbpackage
  syn cluster javaClasses add=orgOmgCorbaOrbpackage
endif
if exists("java_highlight_org_omg_corba_portable") || exists("java_highlight_all")
  syn keyword orgOmgCorbaPortable  ApplicationException Delegate IDLEntity InputStream InvokeHandler
  syn keyword orgOmgCorbaPortable  ObjectImpl OutputStream RemarshalException ResponseHandler 
  syn keyword orgOmgCorbaPortable  ServantObject Streamable
  JavaHiLink orgOmgCorbaPortable           javaConstant
  syn cluster javaTop add=orgOmgCorbaPortable
  syn cluster javaClasses add=orgOmgCorbaPortable
endif
if exists("java_highlight_org_omg_corba_typecodepackage") || exists("java_highlight_all")
  syn keyword orgOmgCorbaTypecodepackage  BadKind Bounds
  JavaHiLink orgOmgCorbaTypecodepackage            javaConstant
  syn cluster javaTop add=orgOmgCorbaTypecodepackage
  syn cluster javaClasses add=orgOmgCorbaTypecodepackage
endif
if exists("java_highlight_org_omg_cosnaming") || exists("java_highlight_all")
  syn keyword orgOmgCosnamingClass  _BindingIteratorImplBase _BindingIteratorStub _NamingContextImplBase
  syn keyword orgOmgCosnamingClass  _NamingContextStub Binding BindingHelper BindingHolder BindingIterator
  syn keyword orgOmgCosnamingClass  BindingIteratorHelper BindingIteratorHolder BindingListHelper
  syn keyword orgOmgCosnamingClass  BindingListHolder BindingType BindingTypeHelper BindingTypeHolder
  syn keyword orgOmgCosnamingClass  IstringHelper NameComponent NameComponentHelper NameComponentHolder
  syn keyword orgOmgCosnamingClass  NameHelper NameHolder NamingContext NamingContextHelper 
  syn keyword orgOmgCosnamingClass  NamingContextHolder
  JavaHiLink orgOmgCosnamingClass          javaConstant
  syn cluster javaTop add=orgOmgCosnamingClass
  syn cluster javaClasses add=orgOmgCosnamingClass
endif
if exists("java_highlight_org_omg_cosnaming_namingcontextpackage") || exists("java_highlight_all")
  syn keyword orgOmgCosnamingNamingcontextpackage  AlreadyBound AlreadyBoundHelper AlreadyBoundHolder
  syn keyword orgOmgCosnamingNamingcontextpackage  CannotProceed CannotProceedHelper CannotProceedHolder
  syn keyword orgOmgCosnamingNamingcontextpackage  InvalidName InvalidNameHelper InvalidNameHolder
  syn keyword orgOmgCosnamingNamingcontextpackage  NotEmpty NotEmtpyHelper NotEmtpyHolder NotFound
  syn keyword orgOmgCosnamingNamingcontextpackage  NotFoundHelper NotFoundHolder NotFoundReason 
  syn keyword orgOmgCosnamingNamingcontextpackage  NotFoundReasonHelper NotFoundReasonHolder
  JavaHiLink orgOmgCosnamingNamingcontextpackage           javaConstant
  syn cluster javaTop add=orgOmgCosnamingNamingcontextpackage
  syn cluster javaClasses add=orgOmgCosnamingNamingcontextpackage
endif
