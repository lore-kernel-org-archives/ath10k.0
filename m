Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine01.qualcomm.com ([199.106.114.254])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VK9X4-0006BO-Sw
 for ath10k@lists.infradead.org; Thu, 12 Sep 2013 16:14:15 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH] ath10k: Calculate correct peer PHY mode for VHT
References: <20130908151955.9228.15022.stgit@localhost6.localdomain6>
Date: Thu, 12 Sep 2013 19:13:49 +0300
In-Reply-To: <20130908151955.9228.15022.stgit@localhost6.localdomain6> (Kalle
 Valo's message of "Sun, 08 Sep 2013 18:19:55 +0300")
Message-ID: <8761u6f26a.fsf@qca.qualcomm.com>
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
To: ath10k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org

Kalle Valo <kvalo@qca.qualcomm.com> writes:

> From: Sujith Manoharan <c_manoha@qca.qualcomm.com>
>
> The peer PHY mode for 11ac operation needs to be determined
> properly based on the channel bandwidth being used. Fix
> this so that the proper mode is given to the firmware.
>
> kvalo: earlier we used 11na-ht20 in STA mode for 11ac AP peer, this
> patch changes that to 11ac-vht80. I didn't notice any change in
> throughput in my tests, but nevertheless it's the right thing
> to do.
>
> Signed-off-by: Sujith Manoharan <c_manoha@qca.qualcomm.com>
> Signed-off-by: Kalle Valo <kvalo@qca.qualcomm.com>

Applied. Thanks Sujith.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
