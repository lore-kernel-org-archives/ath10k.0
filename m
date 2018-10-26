Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by casper.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gG1h2-0002uT-4r
 for ath10k@lists.infradead.org; Fri, 26 Oct 2018 12:58:26 +0000
MIME-Version: 1.0
Date: Fri, 26 Oct 2018 18:28:04 +0530
From: Anilkumar Kolli <akolli@codeaurora.org>
Subject: Re: [PATCH 2/2] ath10k: report tx rate using
 ieee80211_tx_rate_update()
In-Reply-To: <20181012113515.202BD6063F@smtp.codeaurora.org>
References: <1539261904-9016-3-git-send-email-akolli@codeaurora.org>
 <20181012113515.202BD6063F@smtp.codeaurora.org>
Message-ID: <186319d123468bce8673c1462507d346@codeaurora.org>
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
To: Kalle Valo <kvalo@codeaurora.org>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

On 2018-10-12 17:05, Kalle Valo wrote:
> Anilkumar Kolli <akolli@codeaurora.org> wrote:
> 
>> Mesh path metric needs tx rate information from ieee80211_tx_status()
>> call but in ath10k there is no mechanism to report tx rate information
>> via ieee80211_tx_status(), the tx rate is only accessible via
>> sta_statiscs() op.
>> 
>> Per peer tx stats has tx rate info available, Tx rate is available
>> to ath10k driver after every 4 PPDU sent in the air. For each PPDU,
>> ath10k driver updates rate informattion to mac80211 using
>> ieee80211_tx_rate_update().
>> 
>> Per peer txrate information is updated through per peer statistics
>> and is available for QCA9888/QCA9984/QCA4019/QCA998X only
>> 
>> Tested on QCA9984 with firmware-5.bin_10.4-3.5.3-00053
>> Tested on QCA998X with firmware-5.bin_10.2.4-1.0-00036
>> 
>> Signed-off-by: Anilkumar Kolli <akolli@codeaurora.org>
> 
> Depends on:
> 
> f8252e7b5a83 mac80211: implement ieee80211_tx_rate_update to update 
> rate
> 
> Currently in mac80211-next.

mac80211 dependent patch is merged.

Please drop this patch, I have rebased this patch on latest ath.git,
and posted v2 https://patchwork.kernel.org/patch/10656927/

-- 
Thanks
Anil.

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
