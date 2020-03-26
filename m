Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail27.static.mailgun.info ([104.130.122.27])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jHPOO-0000Bn-0v
 for ath10k@lists.infradead.org; Thu, 26 Mar 2020 10:05:43 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: Re: [PATCH] ath10k: enable radar detection in secondary segment
References: <1585158041-11740-1-git-send-email-ssreeela@codeaurora.org>
 <20200326100139.5BC86C433BA@smtp.codeaurora.org>
Date: Thu, 26 Mar 2020 12:05:16 +0200
In-Reply-To: <20200326100139.5BC86C433BA@smtp.codeaurora.org> (Kalle Valo's
 message of "Thu, 26 Mar 2020 10:01:39 +0000 (UTC)")
Message-ID: <87o8sj2zz7.fsf@kamboji.qca.qualcomm.com>
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
To: Sowmiya Sree Elavalagan <ssreeela@codeaurora.org>
Cc: Lei Wang <leiwa@codeaurora.org>, linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

Kalle Valo <kvalo@codeaurora.org> writes:

> Sowmiya Sree Elavalagan <ssreeela@codeaurora.org> wrote:
>
>> From: Lei Wang <leiwa@codeaurora.org>
>> 
>> Enable radar detection in secondary segment for VHT160 and VHT80+80 mode
>> on DFS channels. Otherwise, when injecting radar pulse in the secondary
>> segment, the DUT can't detect radar pulse.
>> 
>> Tested: qca9984 with firmware ver 10.4-3.10-00047
>> 
>> Signed-off-by: Lei Wang <leiwa@codeaurora.org>
>> Signed-off-by: Sowmiya Sree Elavalagan <ssreeela@codeaurora.org>
>
> Failed to apply:
>
> error: patch failed: drivers/net/wireless/ath/ath10k/wmi.c:1717
> error: drivers/net/wireless/ath/ath10k/wmi.c: patch does not apply
> stg import: Diff does not apply cleanly
>
> Patch set to Changes Requested.

I guess this depends on "ath10k: enable VHT160 and VHT80+80 modes"? If
that's the case then you should submit them in the same patchset to make
the dependency clear.

-- 
https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
