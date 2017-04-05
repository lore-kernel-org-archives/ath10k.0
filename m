Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine01.qualcomm.com ([199.106.114.254])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cvgch-0003AC-Hl
 for ath10k@lists.infradead.org; Wed, 05 Apr 2017 08:51:39 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: ath10k: Clean header files from bad block comments
Date: Wed, 5 Apr 2017 08:48:26 +0000
Message-ID: <87zifvi6jp.fsf@kamboji.qca.qualcomm.com>
References: <1487601530-22932-1-git-send-email-marcin.rokicki@tieto.com>
 <744f9259075b4d0784712a5cd272024e@euamsexm01a.eu.qualcomm.com>
In-Reply-To: <744f9259075b4d0784712a5cd272024e@euamsexm01a.eu.qualcomm.com>
 (Kalle Valo's message of "Wed, 5 Apr 2017 09:45:39 +0200")
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
To: Marcin Rokicki <marcin.rokicki@tieto.com>
Cc: "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

Kalle Valo <kvalo@qca.qualcomm.com> writes:

> Marcin Rokicki <marcin.rokicki@tieto.com> wrote:
>> Fix output from checkpatch.pl like:
>>  Block comments use a trailing */ on a separate line
>> 
>> Signed-off-by: Marcin Rokicki <marcin.rokicki@tieto.com>
>
> Patch applied to ath-next branch of ath.git, thanks.
>
> 37ff1b0df37a ath10k: clean header files from bad block comments

I also enabled the checkpatch warning in ath10k-check so that we can
catch any new warnings:

https://github.com/qca/qca-swiss-army-knife/commit/e23fbd3c9647c20e29e819b8a6d934e1b56067b9

-- 
Kalle Valo
_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
