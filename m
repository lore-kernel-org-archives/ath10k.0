Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sonic307-56.consmr.mail.ne1.yahoo.com ([66.163.190.31])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jOFxm-00056h-63
 for ath10k@lists.infradead.org; Tue, 14 Apr 2020 07:26:31 +0000
From: Nicola Mori <nicolamori@aol.com>
Subject: Killer WiFi card keeps disconnecting due to latest firmware
Message-ID: <b07a7ea1-7ab2-8ce3-95d7-6726e7708749@aol.com>
Date: Tue, 14 Apr 2020 09:26:16 +0200
MIME-Version: 1.0
Content-Language: en-US
References: <b07a7ea1-7ab2-8ce3-95d7-6726e7708749.ref@aol.com>
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

Hi, I have an issue with the WiFi card in my laptop, that keeps 
disconnecting from the network in a strange way: randomly every 1-2 
hours I can't access web pages or even ping the gateway, but existing 
connections (like existing ssh sessions or Zoom videoconferences) 
continue to work. The only solution is to restart the network connection.

The fix for me has been to downgrade the firmware by removing 
/usr/lib/firmware/ath10k/QCA6174/hw3.0/firmware-6.bin so that 
/usr/lib/firmware/ath10k/QCA6174/hw3.0/firmware-4.bin is used; with 
this, I have no issues.

The problem is described in details in this Archlinux forum thread:

   https://bbs.archlinux.org/viewtopic.php?pid=1898028

I can provide additional information if needed.
Thanks,

Nicola

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
