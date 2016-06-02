Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail2.student.tuwien.ac.at ([193.170.74.22])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1b8N4T-0007Ko-E6
 for ath10k@lists.infradead.org; Thu, 02 Jun 2016 07:29:38 +0000
Received: from [192.168.0.203] ([212.69.186.40]) (authenticated bits=0)
 by mail2.student.tuwien.ac.at (8.13.8/8.13.8) with ESMTP id u527R5jp028958
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NO)
 for <ath10k@lists.infradead.org>; Thu, 2 Jun 2016 09:27:05 +0200
From: Stefan Feirer <e0926020@student.tuwien.ac.at>
Subject: Support of 802.11k
Message-ID: <574FDFC9.1070801@student.tuwien.ac.at>
Date: Thu, 2 Jun 2016 09:27:05 +0200
MIME-Version: 1.0
List-Id: <ath10k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+kvalo=adurom.com@lists.infradead.org
To: ath10k@lists.infradead.org

Hello,

I'm currently working on my master thesis at vienna university of 
technology.
Topic of my work is building a prototype to measure wifi roaming 
performance with 802.11k (Radio Resouce Management) and 802.11r protocol 
amendments.
My hardware setup uses the PCIe Wifi Card Compex WLE600VX with QCA9882 
Chipset and ath10k_pci kernel module.
Operating System is Ubuntu 15.10 with Kernel Version 4.2.

With my setup 802.11r is working well with wpa_supplicant but I'm not 
able to get 802.11k working.
As I already mentioned I'm using the ath10k kernel module with firmware 
version 10.2.4.45.

I suppose 802.11k (RRM) is not working because it is not supported by 
the firmware.
The reason of my guess is the following:
When I looked through the ath10k source code for RRM support I found out 
that in the file wmi.c there are the structs
  - wmi_cmd_map
  - wmi_10x_cmd_map
  - wmi_10_2_4_cmd_map

In the last two the function bcn_tmpl_cmdid and prb_tmpl_cmdid both are 
not supported (and I use firmware version 10.2.4) and these use the 
struct wmi_bcn_prb_info (wmi.h) which includes the rrm info.

This leads me to two questions:
- Am I right, that the firmware does not support 802.11k or should 
802.11k be supported by the QCA9882 Chipset and the atheros firmware and 
kernel modules?
- Are there any atheros wifi modules which were successfully tested with 
802.11k?

Hopefully someone can help me with this!
Thanks
Stefan Feirer


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
