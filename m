Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smail.rz.tu-ilmenau.de ([141.24.186.67])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k5X6u-0005wg-E7
 for ath10k@lists.infradead.org; Tue, 11 Aug 2020 16:26:49 +0000
Received: from [141.24.19.7] (unknown [141.24.19.7])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by smail.rz.tu-ilmenau.de (Postfix) with ESMTPSA id 7015C580061
 for <ath10k@lists.infradead.org>; Tue, 11 Aug 2020 18:26:44 +0200 (CEST)
From: Markus Theil <markus.theil@tu-ilmenau.de>
Subject: Maximum MTU for ath10k devices
Message-ID: <681fd699-9ec5-968a-f9f9-2a1fed8b53e5@tu-ilmenau.de>
Date: Tue, 11 Aug 2020 18:26:44 +0200
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

I tried to use a MTU larger than 1500 and smaller than 2304 Byte, for
example 1600, with two ath10k devices (QCA9888) and was not able to get
any ping through. Do these cards support ethernet frames larger than
1500 Byte?

Kernel was Linux 5.7, firmware ver 10.4-3.9.0.2-00086.

Regards,
Markus



_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
