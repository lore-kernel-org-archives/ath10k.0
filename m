Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from bay004-omc2s13.hotmail.com ([65.54.190.88])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bFbPv-0007RH-9a
 for ath10k@lists.infradead.org; Wed, 22 Jun 2016 06:13:39 +0000
Message-ID: <BAY172-W4820DFFAF81043D5407B3EE02C0@phx.gbl>
From: sunder Kumaresan <sunder_k@hotmail.com>
Subject: ath10k  firmware version - 10.4
Date: Wed, 22 Jun 2016 06:13:17 +0000
MIME-Version: 1.0
List-Id: <ath10k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: quoted-printable
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+kvalo=adurom.com@lists.infradead.org
To: "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

Hello all,


Trying to use  QCA9980 hardware with ath10k version using 10.4 version firm=
ware.  The recommended kernel version is 4.2 from the link https://wireless=
.wiki.kernel.org/en/users/drivers/ath10k/firmware.


 From the link ,=93git://git.kernel.org/pub/scm/linux/kernel/git/agruen/lin=
ux.git" kernel version 4.2.0(rc7).



In the file, drivers/net/wireless/ath/ath10k/pci.c supports for the followi=
ng devices. =




static const struct pci_device_id ath10k_pci_id_table[] =3D {

        { PCI_VDEVICE(ATHEROS, QCA988X_2_0_DEVICE_ID) }, /* PCI-E QCA988X V=
2 */

        { PCI_VDEVICE(ATHEROS, QCA6174_2_1_DEVICE_ID) }, /* PCI-E QCA6174 V=
2.1 */

        {0}

};

 =


It does not show up for QCA9980.



The kernel version beyond  4.4 provides support for QCA99X0. =




The kernel version 4.7 ath10k driver has been back-ported to 4.1 has been u=
sed  using yocto SDK 2.0 version .  The interface comes up.  =




But, When boardData_AR900B_CUS239_5G_v2_001.bin  and boardData_AR900B_CUS26=
0_2G_v2_002.bin  have been renamed as board xxx. bin files.  It shows up as=
 mismatch in the magic number.



Want to know correct   version of Linux kernel  and its location. =


 =



 =




Best Regards,

k.sunder  		 	   		  =

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
