Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-db5eur01on0054.outbound.protection.outlook.com
 ([104.47.2.54] helo=EUR01-DB5-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fIKW8-000611-HC
 for ath10k@lists.infradead.org; Mon, 14 May 2018 20:56:26 +0000
Subject: Re: [PATCH 2/2] ath10k: DFS Host Confirmation
References: <1525110339-25326-1-git-send-email-srirrama@codeaurora.org>
 <1525110339-25326-3-git-send-email-srirrama@codeaurora.org>
 <0c224b54-dd10-576f-944f-2d20d1cb2c46@bowerswilkins.com>
 <87d0ye2t75.fsf@kamboji.qca.qualcomm.com>
 <4c3ae0c5-0b26-3be9-ccad-ea71b325d5ad@bowerswilkins.com>
 <87lgcmqfaz.fsf@kamboji.qca.qualcomm.com>
From: Peter Oh <peter.oh@bowerswilkins.com>
Message-ID: <e491e3fe-fc45-570f-a27c-ddaf376a1d25@bowerswilkins.com>
Date: Mon, 14 May 2018 13:55:56 -0700
MIME-Version: 1.0
In-Reply-To: <87lgcmqfaz.fsf@kamboji.qca.qualcomm.com>
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
Cc: linux-wireless@vger.kernel.org, Sriram R <srirrama@codeaurora.org>, ath10k@lists.infradead.org


>> Which regulatory enforcement are you talking to? Are you talking about
>> such "prevent users from changing regulatory domain" or "don't provide
>> a manner to change regulatory domain or channel list" ? If not, can
>> you share the section of document?
> Sorry, I don't have any references about that.
>
This question is for "what the patch is trying to solve" and "to comply 
FCC regulatory rule" is not the right answer. It should be answered by 
"FCC regulatory rule section xx.xx.xx".
So we all can double check if this patch addresses "the root cause of 
the requirement" and "if it's the best approach or not"

Thanks,
Peter

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
