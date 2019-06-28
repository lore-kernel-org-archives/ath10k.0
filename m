Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hgrGG-0003E8-9y
 for ath10k@lists.infradead.org; Fri, 28 Jun 2019 13:49:57 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: Re: ath10k-firmware: QCA9888 hw2.0: Add BDF for Linksys EA8300 [2/2]
References: <ac097652-455f-cd1f-0f48-f19fad61933c@allycomm.com>
Date: Fri, 28 Jun 2019 16:49:52 +0300
In-Reply-To: <ac097652-455f-cd1f-0f48-f19fad61933c@allycomm.com> (Jeff
 Kletsky's message of "Fri, 17 May 2019 09:39:05 -0700")
Message-ID: <87pnmxbz0f.fsf@kamboji.qca.qualcomm.com>
MIME-Version: 1.0
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
To: Jeff Kletsky <lede@allycomm.com>
Cc: ath10k@lists.infradead.org

Jeff Kletsky <lede@allycomm.com> writes:

> Support for the Linksys EA8300 under OpenWrt is undergoing final
> review. This is a QCA4019-based device with a PCI-attached QCA9888
> supplying a third radio on 5 GHz. The OEM's firmware and source
> suggest that this device is "based on Qualcomm AP DK07.1-c1"
>
> Linksys ships four market-specific variants of this device, notated as
> -AH, -EU, (no suffix), and -CA. They supply four sets of pre-cal board
> files in their firmware, AH, EU, FCC, and IC. The corresponding files
> differ from each other, and appear to provide different parameters in
> the different regions. The OEM firmware copies the appropriate set of
> files into place based on examining the SKU of the device at boot.
>
> These board files may be obtained from extraction of the OEM firmware
> Ver. 1.1.4.191539, Latest Date: 11/8/2018, 49.0 MB
> http://downloads.linksys.com/downloads/firmware/FW_EA8300_1.1.4.191539_prod.img
> Ver. 1.1.3.184925, Latest Date: 11/15/2017, 47.4 MB
> http://downloads.linksys.com/downloads/firmware/FW_EA8300_1.1.3.184925_prod.img
> and/or from a running device. There does not appear to be a difference
> in the board files between the two firmware versions.
>
> DTS for the EA8300 under OpenWrt expects that the variant be encoded
> as, for example, linksys-ea8300-fcc, with the lower-cased suffix
> indicating the OEM's regional code, or -fcc.
>
> Two similar messages will be sent, one for each chipset, as per the directions.
>
>
> The files selected and their original names and organization include:
>
>     27d9dfe1e86c3befe808f89dd3cd105b  OEM/QCA9888/IC/boardData_2_0_QCA9888_5G_Y9690_SBS_HB.bin
>     7f2f0de6c0fb2df1d642895d8233d3ef  OEM/QCA9888/EU/boardData_2_0_QCA9888_5G_Y9690_SBS_HB.bin
>     62049f88a498e51870973143e376e7af  OEM/QCA9888/FCC/boardData_2_0_QCA9888_5G_Y9690_SBS_HB.bin
>     27d71485fc4987bc1c11b7744c373b59  OEM/QCA9888/AH/boardData_2_0_QCA9888_5G_Y9690_SBS_HB.bin
>     435d236890521515feffc834218ca594  OEM/IPQ4019/IC/boardData_1_0_IPQ4019_DK04_5G.bin
>     e8858ab9259f7d4372040da1c592d1cc  OEM/IPQ4019/IC/boardData_1_0_IPQ4019_DK04_2G.bin
>     d6d7ed00db985b4d8c48ccc3fe10fa87  OEM/IPQ4019/EU/boardData_1_0_IPQ4019_DK04_5G.bin
>     5cef8208a0345c1469494e44e1f370f1  OEM/IPQ4019/EU/boardData_1_0_IPQ4019_DK04_2G.bin
>     0e820f5946b5773ad9f4a74809c05b79  OEM/IPQ4019/FCC/boardData_1_0_IPQ4019_DK04_5G.bin
>     057ed5528e360197c2239796710cb61c  OEM/IPQ4019/FCC/boardData_1_0_IPQ4019_DK04_2G.bin
>     0171919a4576199ae88e8831f72c03fe  OEM/IPQ4019/AH/boardData_1_0_IPQ4019_DK04_5G.bin
>     a8e23769dc98da97b6c70a4f601ffca8  OEM/IPQ4019/AH/boardData_1_0_IPQ4019_DK04_2G.bin
>
>
> The files were renamed as follows:
>
>     for JD in AH EU FCC IC ; do
>         jd=$(echo "$JD" | tr 'A-Z' 'a-z')
>         cp -vp OEM/IPQ4019/${JD}/boardData_1_0_IPQ4019_DK04_2G.bin \
> 	    ${dest}/bus=ahb,bmi-chip-id=0,bmi-board-id=20,variant=linksys-ea8300-${jd}
>         cp -vp OEM/IPQ4019/${JD}/boardData_1_0_IPQ4019_DK04_5G.bin \
> 	    ${dest}/bus=ahb,bmi-chip-id=0,bmi-board-id=21,variant=linksys-ea8300-${jd}
>         cp -vp OEM/QCA9888/${JD}/boardData_2_0_QCA9888_5G_Y9690_SBS_HB.bin \
> 	    ${dest}/bus=pci,bmi-chip-id=0,bmi-board-id=23,variant=linksys-ea8300-${jd}
>     done
>
>
> Renamed board files are individually attached to the IPQ4019 and QCA9888
> messages. dmesg excerpts are from the device running OpenWrt with
> locally crafted, aggregate board files.
>
>
>
> For the QCA9888:
>
>     ath10k_pci 0000:01:00.0: qca9888 hw2.0 target 0x01000000 chip_id 0x00000000 sub 0000:0000
>
>     ath10k_pci 0000:01:00.0: board_file api 2 bmi_id 0:23 crc32 b050e9d6
>
>
> bus=pci,bmi-chip-id=0,bmi-board-id=23,variant=linksys-ea8300-eu
> 7f2f0de6c0fb2df1d642895d8233d3ef
>
> bus=pci,bmi-chip-id=0,bmi-board-id=23,variant=linksys-ea8300-ic
> 27d9dfe1e86c3befe808f89dd3cd105b
>
> bus=pci,bmi-chip-id=0,bmi-board-id=23,variant=linksys-ea8300-ah
> 27d71485fc4987bc1c11b7744c373b59
>
> bus=pci,bmi-chip-id=0,bmi-board-id=23,variant=linksys-ea8300-fcc
> 62049f88a498e51870973143e376e7af

My script expects that the attachments end with '.bin' suffix. Could you
please fix that and resend everything?

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
