Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine01.qualcomm.com ([199.106.114.254])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1anQNv-0003GD-OP
 for ath10k@lists.infradead.org; Tue, 05 Apr 2016 12:47:08 +0000
From: "Valo, Kalle" <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH 3/3] ath10k: fix unconditional num_mpdus_ready subtraction
Date: Tue, 5 Apr 2016 12:46:37 +0000
Message-ID: <87wpocb4ur.fsf@kamboji.qca.qualcomm.com>
References: <1459352551-11773-1-git-send-email-rmanohar@qti.qualcomm.com>
 <1459352551-11773-3-git-send-email-rmanohar@qti.qualcomm.com>
 <56FD71D3.5090103@candelatech.com>
 <73a1d6a04908fe060559d1a6e9afb128@codeaurora.org>
In-Reply-To: <73a1d6a04908fe060559d1a6e9afb128@codeaurora.org> (Rajkumar
 Manoharan's message of "Fri, 01 Apr 2016 10:49:05 +0530")
Content-Language: en-US
Content-ID: <76FF178619C085489607C94365F01972@qualcomm.com>
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
To: Rajkumar Manoharan <rmanohar@codeaurora.org>
Cc: Ben Greear <greearb@candelatech.com>, "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, "Manoharan,
 Rajkumar" <rmanohar@qti.qualcomm.com>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

Rajkumar Manoharan <rmanohar@codeaurora.org> writes:

> On 2016-04-01 00:22, Ben Greear wrote:
>> On 03/30/2016 08:42 AM, Rajkumar Manoharan wrote:
>>> Decrement num_mpdus_ready only when rx amsdu is processed
>>> successfully.
>>> Not doing so, will result in leak and impact stabilty under low memory
>>> cases.
>>
>> Should this patch be rebased on top of the "ath10k: process htt rx
>> indication as batch mode" patch?
>>
> It should be on top of "ath10k: speedup htt rx descriptor processing
> for rx_ind". Instead of sending next version of original series, i
> sent it as follow up.

Should this commit log have a fixes line like this:

Fixes: 59465fe46ef1 ("ath10k: speedup htt rx descriptor processing for tx completion")

-- 
Kalle Valo
_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
