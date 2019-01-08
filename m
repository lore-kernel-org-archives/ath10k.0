Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from exchange.tu-berlin.de ([130.149.7.70])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1ggrIw-0003S0-UH
 for ath10k@lists.infradead.org; Tue, 08 Jan 2019 13:20:29 +0000
Received: from SPMA-03.tubit.win.tu-berlin.de (localhost.localdomain
 [127.0.0.1])
 by localhost (Email Security Appliance) with SMTP id B7D936DF0E_C34A391B
 for <ath10k@lists.infradead.org>; Tue,  8 Jan 2019 13:20:17 +0000 (GMT)
Received: from exchange.tu-berlin.de (exchange.tu-berlin.de [130.149.7.70])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (Client CN "exchange.tu-berlin.de",
 Issuer "DFN-Verein Global Issuing CA" (not verified))
 by SPMA-03.tubit.win.tu-berlin.de (Sophos Email Appliance) with ESMTPS id
 8603E6DF05_C34A391F
 for <ath10k@lists.infradead.org>; Tue,  8 Jan 2019 13:20:17 +0000 (GMT)
From: Martin Fleischer <martin.fleischer@campus.tu-berlin.de>
Subject: MU-MIMO stream assignment
Message-ID: <692035e7-c2bc-f7e6-de4a-d82b8d8bb5b5@campus.tu-berlin.de>
Date: Tue, 8 Jan 2019 14:20:17 +0100
MIME-Version: 1.0
Content-Language: en-US
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

I'm trying to get control over the MU-MIMO stream assignment. It seems,
that the firmware doesn't give me precise control over the MU-MIMO
streams, but rather the hardware schedules the clients. In a qualcomm
paper I found some hints how clients might be scheduled, but nothing
concrete.

https://www.qualcomm.com/media/documents/files/802-11ac-mu-mimo-bridging-the-mimo-gap-in-wi-fi.pdf

For me it looks like the scheduler selects clients also based on WMM
parameters. Does anyone have some insights into the MU-MIMO stream
scheduling that can help to get some control?

Best regards,

Martin



_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
