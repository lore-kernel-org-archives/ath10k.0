Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mxout2.iskon.hr ([213.191.128.81])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dAMm9-0006wY-A1
 for ath10k@lists.infradead.org; Mon, 15 May 2017 20:39:31 +0000
Received: from mxscanout.iskon.hr (localhost [127.0.0.1])
 by localhost (Postfix) with SMTP id 93ADAA991B
 for <ath10k@lists.infradead.org>; Mon, 15 May 2017 22:38:59 +0200 (CEST)
Received: from mxscanout.iskon.hr (localhost [127.0.0.1])
 by mxscanout (MCF 1.0.2) with SMTP for ath10k@lists.infradead.org;
 Mon, 15 May 2017 22:38:59 +0200 (CEST)
Received: from in1.mail.iskon.hr (in1.mail.iskon.hr [213.191.133.66])
 by mxscanout.iskon.hr (Postfix) with ESMTP id 92258A9317
 for <ath10k@lists.infradead.org>; Mon, 15 May 2017 22:38:59 +0200 (CEST)
Received: from in1 (localhost [127.0.0.1])
 by in1.mail.iskon.hr (Postfix) with ESMTP id 3wRXVW3zyPz15hj
 for <ath10k@lists.infradead.org>; Mon, 15 May 2017 22:38:59 +0200 (CEST)
Received: from webmail.iskon.hr (webmail.iskon.hr [213.191.133.146])
 by in1.mail.iskon.hr (Postfix) with ESMTP id 3wRXVV5w0wz15hf
 for <ath10k@lists.infradead.org>; Mon, 15 May 2017 22:38:58 +0200 (CEST)
Received: from webmail.iskon.hr (localhost [127.0.0.1])
 by webmail.iskon.hr (Postfix) with ESMTP id 5FDD32403F
 for <ath10k@lists.infradead.org>; Mon, 15 May 2017 22:38:58 +0200 (CEST)
MIME-Version: 1.0
Date: Mon, 15 May 2017 22:38:58 +0200
From: Filip Fila <filip.fila@inet.hr>
Subject: QCA6147 (rev 32) Speed and Connectivity Issues
Message-ID: <e4aaf4b100861243e607bfad0d968289@inet.hr>
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

I recently bought a Lenovo V510 laptop that comes with a QCA6147 (rev 
32) chip.

I am having quite a few issues with it in Linux. I've researched all I 
could on the internet and haven't been able to solve them so I come to 
you as a last resort.

The issue is that the chip does not work with NetworkManager at all - 
wireless won't turn itself on, meaning no connections are listed.

It's possible to connect through cli with netctl or connman, however, 
there are three issues:

1) the max speed is roughly half the amount it reaches in Windows;
2) the speed will fluctuate a lot, reaching its capped max and then 
instantly dropping to even 10-20% of the maximum connection speed, 
sometimes even to speeds like 50 kb/s;
3) once in a while, I assume the drivers don't load during boot and no 
connection can be established.

The kernel used is 4.11, NetworkManager is at 1.8 and I also replaced 
all the firmware files with the latest ones from Kvalo's GitHub repo, 
but the result is the same.

Could you please let me know if this is perhaps a hardware problem, and 
if not, are this chip's drivers going to be updated so that it works out 
of the box (with NetworkManager and its GUI applets) and at full speed? 
If I could be of assistance with any kind of output messages, I will 
gladly do my best to help out.

Best regards,
Filip Fila


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
