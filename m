Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine01.qualcomm.com ([199.106.114.254])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YccRd-0000Kv-My
 for ath10k@lists.infradead.org; Mon, 30 Mar 2015 16:21:46 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH v5 2/7] ath10k: implement chanctx API
References: <1427200993-7550-1-git-send-email-michal.kazior@tieto.com>
 <1427200993-7550-3-git-send-email-michal.kazior@tieto.com>
Date: Mon, 30 Mar 2015 19:21:10 +0300
In-Reply-To: <1427200993-7550-3-git-send-email-michal.kazior@tieto.com>
 (Michal Kazior's message of "Tue, 24 Mar 2015 12:43:08 +0000")
Message-ID: <87iodi318p.fsf@kamboji.qca.qualcomm.com>
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
To: Michal Kazior <michal.kazior@tieto.com>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

Michal Kazior <michal.kazior@tieto.com> writes:

> The chanctx API will allow ath10k to support
> multi-channel operation.
>
> Signed-off-by: Michal Kazior <michal.kazior@tieto.com>

kbuild reports:

sparse warnings: (new ones prefixed by >>)

>> drivers/net/wireless/ath/ath10k/mac.h:72:57: sparse: incorrect type in initializer (different address spaces)
   drivers/net/wireless/ath/ath10k/mac.h:72:57:    expected struct ieee80211_chanctx_conf *conf
   drivers/net/wireless/ath/ath10k/mac.h:72:57:    got struct ieee80211_chanctx_conf [noderef] <asn:4>*chanctx_conf
>> drivers/net/wireless/ath/ath10k/mac.h:72:57: sparse: incorrect type in initializer (different address spaces)
   drivers/net/wireless/ath/ath10k/mac.h:72:57:    expected struct ieee80211_chanctx_conf *conf
   drivers/net/wireless/ath/ath10k/mac.h:72:57:    got struct ieee80211_chanctx_conf [noderef] <asn:4>*chanctx_conf
>> drivers/net/wireless/ath/ath10k/mac.h:72:57: sparse: incorrect type in initializer (different address spaces)
   drivers/net/wireless/ath/ath10k/mac.h:72:57:    expected struct ieee80211_chanctx_conf *conf
   drivers/net/wireless/ath/ath10k/mac.h:72:57:    got struct ieee80211_chanctx_conf [noderef] <asn:4>*chanctx_conf
>> drivers/net/wireless/ath/ath10k/mac.h:72:57: sparse: incorrect type in initializer (different address spaces)
   drivers/net/wireless/ath/ath10k/mac.h:72:57:    expected struct ieee80211_chanctx_conf *conf
   drivers/net/wireless/ath/ath10k/mac.h:72:57:    got struct ieee80211_chanctx_conf [noderef] <asn:4>*chanctx_conf
>> drivers/net/wireless/ath/ath10k/mac.h:72:57: sparse: incorrect type in initializer (different address spaces)
   drivers/net/wireless/ath/ath10k/mac.h:72:57:    expected struct ieee80211_chanctx_conf *conf
   drivers/net/wireless/ath/ath10k/mac.h:72:57:    got struct ieee80211_chanctx_conf [noderef] <asn:4>*chanctx_conf
>> drivers/net/wireless/ath/ath10k/mac.h:72:57: sparse: incorrect type in initializer (different address spaces)
   drivers/net/wireless/ath/ath10k/mac.h:72:57:    expected struct ieee80211_chanctx_conf *conf
   drivers/net/wireless/ath/ath10k/mac.h:72:57:    got struct ieee80211_chanctx_conf [noderef] <asn:4>*chanctx_conf
>> drivers/net/wireless/ath/ath10k/mac.h:72:57: sparse: incorrect type in initializer (different address spaces)
   drivers/net/wireless/ath/ath10k/mac.h:72:57:    expected struct ieee80211_chanctx_conf *conf
   drivers/net/wireless/ath/ath10k/mac.h:72:57:    got struct ieee80211_chanctx_conf [noderef] <asn:4>*chanctx_conf
--
>> drivers/net/wireless/ath/ath10k/mac.h:72:57: sparse: incorrect type in initializer (different address spaces)                                                                                                                                                                                                               
   drivers/net/wireless/ath/ath10k/mac.h:72:57:    expected struct ieee80211_chanctx_conf *conf                                                                                                                                                                                                                                
   drivers/net/wireless/ath/ath10k/mac.h:72:57:    got struct ieee80211_chanctx_conf [noderef] <asn:4>*chanctx_conf                                                                                                                                                                                                            
>> drivers/net/wireless/ath/ath10k/mac.h:72:57: sparse: incorrect type in initializer (different address spaces)                                                                                                                                                                                                               
   drivers/net/wireless/ath/ath10k/mac.h:72:57:    expected struct ieee80211_chanctx_conf *conf                                                                                                                                                                                                                                
   drivers/net/wireless/ath/ath10k/mac.h:72:57:    got struct ieee80211_chanctx_conf [noderef] <asn:4>*chanctx_conf                                   

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
