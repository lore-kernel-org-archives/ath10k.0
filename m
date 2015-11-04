Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp14.openmailbox.org ([62.4.1.48])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZtlVq-0001OB-Kr
 for ath10k@lists.infradead.org; Wed, 04 Nov 2015 00:01:15 +0000
Received: from www.openmailbox.org (openmailbox-b1 [10.91.69.218])
 by mail2.openmailbox.org (Postfix) with ESMTP id D17B42AC1BD8
 for <ath10k@lists.infradead.org>; Wed,  4 Nov 2015 01:00:48 +0100 (CET)
MIME-Version: 1.0
Date: Wed, 04 Nov 2015 00:00:47 +0000
From: theros@openmailbox.org
Subject: QCA6174 seemingly randomly fails to wake
Message-ID: <45672dcebea40166c2e5edc31c818b96@openmailbox.org>
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

I am having issues with the ath10k driver and the Qualcomm Atheros 
QCA6174 network adapter. Seemingly randomly, the wireless connection on 
my laptop stops working. dmesg outputs a long series of:

[11061.645929] ath10k_pci 0000:07:00.0: failed to wake target for 
write32 of 0x0000025c at 0x0003543c: -110

Rarely a reboot fixes this and I can use the network adapter again, but 
more often than not, after a reboot, there is no output related to 
ath10k in dmesg and the laptop is behaving as if the network adapter is 
not present. The adapter eventually starts working again - I have not 
noticed a specific pattern, sometimes it is after a few hours, sometimes 
I couldn't get it working for days.

I have tried thoroughly searching online but was unable to find anything 
that would be of help. I do admit I am a little out of my depth here, 
but I will happily provide any further information necessary in order to 
diagnose and fix this.

I am on Xubuntu 15.10, kernel 4.2.0-16-generic.

Thanks.


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
