<!DOCTYPE html>

<head>
    <?php
    include("../TheHead/TheHeadHandling.html");
    ?>
</head>

<body>
    <section id="container">
        <!--header start-->

        <?php
        include("../Header/HeaderView.php");
        ?>

        <!--header end-->
        <!--sidebar start-->

        <?php
        include("../SideBar/SidebarStart.php");
        ?>

        <!--sidebar end-->
        <!--main content start-->
        <section id="main-content">

            <?php
            switch ($_GET['act']) {
                case 'NewProduct':
                    include("../../NewProduct/NewProduct.php");
                    break;

                case 'NewProductLapTop':
                    include("../../NewProduct/NewProductLapTop.php");
                    break;

                case 'Order':
                    include("../../Order/Order.php");
                    break;

                case 'OrderDetails':
                    include("../../DetailsOrder/OrderDetails.php");
                    break;

                case 'User':
                    include("../../User/User.php");
                    break;

                case 'AddProducts':
                    include("../../Product/add_product.php");
                    break;

                case 'AddNewProducts':
                    include("../../NewProduct/add_new_product.php");
                    break;

                case 'AddUser':
                    include("../../User/add_user.php");
                    break;

                default:
                    include("../../NewProduct/NewProduct.php");
                    break;
            }
            ?>

            <!-- footer -->

            <?php
            include("../Footer/FooterView.php");
            ?>

            <!-- / footer -->
        </section>

        <!--main content end-->
    </section>

    <?php
    include("../JavaScriptHandling/JsHandling.html");
    ?>

</body>

</html>