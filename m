Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-qt1-x831.google.com ([2607:f8b0:4864:20::831])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jKLSV-00022x-AN
 for ath10k@lists.infradead.org; Fri, 03 Apr 2020 12:30:05 +0000
Received: by mail-qt1-x831.google.com with SMTP id y25so6205942qtv.7
 for <ath10k@lists.infradead.org>; Fri, 03 Apr 2020 05:30:02 -0700 (PDT)
MIME-Version: 1.0
References: <CAJoWQ3eRgEv0x=t0=2nHqyY5FkCpzWz4A6qgFPN3RuJ3cDjFug@mail.gmail.com>
In-Reply-To: <CAJoWQ3eRgEv0x=t0=2nHqyY5FkCpzWz4A6qgFPN3RuJ3cDjFug@mail.gmail.com>
From: Bogdan Dziedzic <bogibzik@gmail.com>
Date: Fri, 3 Apr 2020 23:30:14 +1100
Message-ID: <CAJoWQ3dPC9=xHrtOjSj6BMQwZVvRO1xrtrfgja76FYmrxywBeA@mail.gmail.com>
Subject: Re: failed to build .ko for ath10k against master
List-Id: <ath10k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+kvalo=adurom.com@lists.infradead.org
To: ath10k@lists.infradead.org

Hi,

performed steps:
git show
commit 5bc4a8084c1f5919707053b991fa2700e3d37635 (HEAD, tag:
 ath-202003221023, origin/master, origin/HEAD, ma


# make ARCH=arm64
CROSS_COMPILE=../../toolchains/gcc-arm-8.3-2019.03-x86_64-aarch64-linux-gnu/bin/aarch64-linux-gnu-
 defconfig

# make ARCH=arm64
CROSS_COMPILE=../../toolchains/gcc-arm-8.3-2019.03-x86_64-aarch64-linux-gnu/bin/aarch64-linux-gnu-
 scripts prepare

# make ARCH=arm64
CROSS_COMPILE=../../toolchains/gcc-arm-8.3-2019.03-x86_64-aarch64-linux-gnu/bin/aarch64-linux-gnu-
-C . M=drivers/net/wireless/ath
...
  LD [M]  drivers/net/wireless/ath/ath10k/ath10k_snoc.o
  MODPOST 4 modules
ERROR: "qmi_add_lookup"
[drivers/net/wireless/ath/ath10k/ath10k_snoc.ko] undefined!
ERROR: "qmi_handle_release"
[drivers/net/wireless/ath/ath10k/ath10k_snoc.ko] undefined!
ERROR: "qmi_txn_init" [drivers/net/wireless/ath/ath10k/ath10k_snoc.ko]
undefined!
ERROR: "qmi_txn_cancel"
[drivers/net/wireless/ath/ath10k/ath10k_snoc.ko] undefined!
ERROR: "qmi_txn_wait" [drivers/net/wireless/ath/ath10k/ath10k_snoc.ko]
undefined!
ERROR: "qmi_send_request"
[drivers/net/wireless/ath/ath10k/ath10k_snoc.ko] undefined!
ERROR: "qcom_scm_assign_mem"
[drivers/net/wireless/ath/ath10k/ath10k_snoc.ko] undefined!
ERROR: "qmi_handle_init"
[drivers/net/wireless/ath/ath10k/ath10k_snoc.ko] undefined!
ERROR: "qmi_response_type_v01_ei"
[drivers/net/wireless/ath/ath10k/ath10k_snoc.ko] undefined!
ERROR: "is_vmalloc_addr"
[drivers/net/wireless/ath/ath10k/ath10k_snoc.ko] undefined!
ERROR: "is_vmalloc_addr"
[drivers/net/wireless/ath/ath10k/ath10k_pci.ko] undefined!
ERROR: "is_vmalloc_addr"
[drivers/net/wireless/ath/ath10k/ath10k_core.ko] undefined!
scripts/Makefile.modpost:93: recipe for target '__modpost' failed
make[1]: *** [__modpost] Error 1
Makefile:1596: recipe for target 'modules' failed
make: *** [modules] Error 2
make: Leaving directory

Similar the build fails with my 'oldconfig' from 5.5.0 and all options
selected as 'no' or default.

I've bumped here as I'm after Erik Stromdahl's work on QCA9377 sdio
with the latest commit  6e51b0e4913ca2c93059f73ca477ca30ea95b6a0

Cheers,
Bo


On Fri, 3 Apr 2020 at 23:27, Bogdan Dziedzic <bogibzik@gmail.com> wrote:
>
> performed steps:
> git show
> commit 5bc4a8084c1f5919707053b991fa2700e3d37635 (HEAD, tag:
>  ath-202003221023, origin/master, origin/HEAD, ma
>
> # make ARCH=arm64 CROSS_COMPILE=../../toolchains/gcc-arm-8.3-2019.03-x86_64-aarch64-linux-gnu/bin/aarch64-linux-gnu-  defconfig
>
> # make ARCH=arm64 CROSS_COMPILE=../../toolchains/gcc-arm-8.3-2019.03-x86_64-aarch64-linux-gnu/bin/aarch64-linux-gnu-  scripts prepare
>
> # make ARCH=arm64 CROSS_COMPILE=../../toolchains/gcc-arm-8.3-2019.03-x86_64-aarch64-linux-gnu/bin/aarch64-linux-gnu- -C . M=drivers/net/wireless/ath
> ...
>   LD [M]  drivers/net/wireless/ath/ath10k/ath10k_snoc.o
>   MODPOST 4 modules
> ERROR: "qmi_add_lookup" [drivers/net/wireless/ath/ath10k/ath10k_snoc.ko] undefined!
> ERROR: "qmi_handle_release" [drivers/net/wireless/ath/ath10k/ath10k_snoc.ko] undefined!
> ERROR: "qmi_txn_init" [drivers/net/wireless/ath/ath10k/ath10k_snoc.ko] undefined!
> ERROR: "qmi_txn_cancel" [drivers/net/wireless/ath/ath10k/ath10k_snoc.ko] undefined!
> ERROR: "qmi_txn_wait" [drivers/net/wireless/ath/ath10k/ath10k_snoc.ko] undefined!
> ERROR: "qmi_send_request" [drivers/net/wireless/ath/ath10k/ath10k_snoc.ko] undefined!
> ERROR: "qcom_scm_assign_mem" [drivers/net/wireless/ath/ath10k/ath10k_snoc.ko] undefined!
> ERROR: "qmi_handle_init" [drivers/net/wireless/ath/ath10k/ath10k_snoc.ko] undefined!
> ERROR: "qmi_response_type_v01_ei" [drivers/net/wireless/ath/ath10k/ath10k_snoc.ko] undefined!
> ERROR: "is_vmalloc_addr" [drivers/net/wireless/ath/ath10k/ath10k_snoc.ko] undefined!
> ERROR: "is_vmalloc_addr" [drivers/net/wireless/ath/ath10k/ath10k_pci.ko] undefined!
> ERROR: "is_vmalloc_addr" [drivers/net/wireless/ath/ath10k/ath10k_core.ko] undefined!
> scripts/Makefile.modpost:93: recipe for target '__modpost' failed
> make[1]: *** [__modpost] Error 1
> Makefile:1596: recipe for target 'modules' failed
> make: *** [modules] Error 2
> make: Leaving directory
>
> Similar the build fails with my 'oldconfig' from 5.5.0 and all options selected as 'no' or default.
>
> I've bumped here as I'm after Erik Stromdahl's work on QCA9377 sdio with the latest commit  6e51b0e4913ca2c93059f73ca477ca30ea95b6a0
>
> Cheers,
> Bo
>

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
