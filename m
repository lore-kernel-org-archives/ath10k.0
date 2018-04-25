Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fBHDJ-0000uz-BB
 for ath10k@lists.infradead.org; Wed, 25 Apr 2018 09:59:50 +0000
MIME-Version: 1.0
Date: Wed, 25 Apr 2018 15:29:37 +0530
From: Anilkumar Kolli <akolli@codeaurora.org>
Subject: Re: [RFC v2] ath10k: report tx rate using ieee80211_tx_status()
In-Reply-To: <87zi1tav6h.fsf@kamboji.qca.qualcomm.com>
References: <1524291786-30850-1-git-send-email-akolli@codeaurora.org>
 <87zi1tav6h.fsf@kamboji.qca.qualcomm.com>
Message-ID: <6b57525f3edc2b7d06b7662efc5d7e5f@codeaurora.org>
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
Cc: linux-wireless-owner@vger.kernel.org, linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

On 2018-04-24 13:32, Kalle Valo wrote:
> Anilkumar Kolli <akolli@codeaurora.org> writes:
> 
>> Mesh path metric needs txrate information from ieee80211_tx_status()
>> call but in ath10k there is no mechanism to report tx rate information
>> via ieee80211_tx_status(), the rate is only accessible via
>> sta_statiscs() op.
>> 
>> Per peer stats has tx rate info available, this patch stores per peer
>> last tx rate and updates the tx rate info structures in tx 
>> completition.
>> The rate updated in ieee80211_tx_status() is not exactly for the last
>> transmitted frame instead the rate is from one of the previous frames.
>> 
>> Per peer txrate information is updated through per peer statistics
>> and is available for QCA9888/QCA9984/QCA4019/QCA998X only
>> 
>> Tested on QCA9984 with firmware-5.bin_10.4-3.5.3-00053
>> Tested on QCA998X with firmware-5.bin_10.2.4-1.0-00036
>> 
>> Signed-off-by: Anilkumar Kolli <akolli@codeaurora.org>
> 
> BTW, your name in patchwork is "akolli@codeaurora.org" but it should be
> "Anilkumar Kolli" and that's why my script uses the wrong name. Please
> fix it by registering to patchwork as it's possible to change your name
> during registration, but only one time. If that doesn't work then send 
> a
> request to helpdesk@kernel.org and the admins will fix it.

I registered and updated name in the patchwork website.
Do I need to resend the patch ?


Thanks
Anil.

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
