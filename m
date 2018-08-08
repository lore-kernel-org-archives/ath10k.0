Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-he1eur01on0063.outbound.protection.outlook.com
 ([104.47.0.63] helo=EUR01-HE1-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fnRla-0001xK-3e
 for ath10k@lists.infradead.org; Wed, 08 Aug 2018 16:56:59 +0000
From: Arthur Watt <arthur.watt@virtuosys.com>
Subject: ath10k kernel requirements (coherent_pool etc)
Date: Wed, 8 Aug 2018 16:56:43 +0000
Message-ID: <VI1PR07MB0926AC2FF08DF458053DD9F7FF260@VI1PR07MB0926.eurprd07.prod.outlook.com>
Content-Language: en-US
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
To: "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

Good afternoon.

We have been testing 3 x ath10k devices on a 4.14 based Linux kernel with a Cavium processor.
Up to this point we have been seeing some unexplained crashes from the ath10k devices (firmware crashes due to corrupt HTC messages is the most common).
We have tried various module and firmware versions (including wireless-latest) and all seem to show the same errors.

Is it possible that there is an inherent memory corrupt problem with the ath10k driver/firmware, since other list members don't seem to be shouting about this we started investigating the kernel configuration and not the driver/firmware?

This morning I made a kernel parameter change
       coherent_pool=256M
Since making this change the number of faults seem to  have reduced.

Does anyone know if there are any Linux kernel configuration parameters needed in order for multiple ath10k devices to behave reliably.
In particular do I need a coherent_pool configured and what page size is the optimum for ath10k operation?
Our ath10k devices are QCA9984 and QCA988X.

Thank you
Arthur



_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
