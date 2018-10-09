Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from gateway33.websitewelcome.com ([192.185.145.23])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1g9xYa-0001nW-9s
 for ath10k@lists.infradead.org; Tue, 09 Oct 2018 19:20:38 +0000
Received: from cm10.websitewelcome.com (cm10.websitewelcome.com [100.42.49.4])
 by gateway33.websitewelcome.com (Postfix) with ESMTP id 547246E1B69
 for <ath10k@lists.infradead.org>;
 Tue,  9 Oct 2018 14:20:13 -0500 (CDT)
Subject: Re: [PATCH] ath10k: htt_rx: Fix signedness bug in
 ath10k_update_per_peer_tx_stats
References: <20181005184245.GA11700@embeddedor.com>
 <3a55bec6-d20d-f500-e741-b228a86b7117@candelatech.com>
 <dd75a8aa-b87c-e325-cc1d-a0efe3664a32@embeddedor.com>
 <fcc51fdd-fc31-9d2c-2e68-4ceecbb86129@embeddedor.com>
 <af44d03892b3d51df391760af7af0382@codeaurora.org>
From: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Message-ID: <7e2f4cc2-dd79-ffb5-f29e-bcbedb7d9663@embeddedor.com>
Date: Tue, 9 Oct 2018 21:19:39 +0200
MIME-Version: 1.0
In-Reply-To: <af44d03892b3d51df391760af7af0382@codeaurora.org>
Content-Language: en-GB
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
To: Anilkumar Kolli <akolli@codeaurora.org>
Cc: linux-wireless-owner@vger.kernel.org, netdev@vger.kernel.org, linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, ath10k@lists.infradead.org, Ben Greear <greearb@candelatech.com>, "David S. Miller" <davem@davemloft.net>, Kalle Valo <kvalo@codeaurora.org>


> 
> I have sent a patch to address this,
> https://patchwork.kernel.org/patch/10611943/
> 

That's great.

Thanks for letting me know. :)

--
Gustavo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
