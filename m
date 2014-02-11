Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-la0-x236.google.com ([2a00:1450:4010:c03::236])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WD8RF-00023K-7N
 for ath10k@lists.infradead.org; Tue, 11 Feb 2014 08:11:29 +0000
Received: by mail-la0-f54.google.com with SMTP id y1so5534320lam.41
 for <ath10k@lists.infradead.org>; Tue, 11 Feb 2014 00:10:56 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <8761omdqe5.fsf@kamboji.qca.qualcomm.com>
References: <1392034375-13532-1-git-send-email-bartosz.markowski@tieto.com>
 <8761omdqe5.fsf@kamboji.qca.qualcomm.com>
Date: Tue, 11 Feb 2014 09:10:56 +0100
Message-ID: <CACKGw+Es7YsNHtg+MJE_82Ffm5m9hHu+qo6nZbo-hoOfqCDmOQ@mail.gmail.com>
Subject: Re: [PATCH] ath10k: AP: handle HT station which does not have HT RX
 MCS
From: Bartosz Markowski <bartosz.markowski@tieto.com>
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
To: Kalle Valo <kvalo@qca.qualcomm.com>
Cc: "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, ath10k <ath10k@lists.infradead.org>

On 11 February 2014 09:06, Kalle Valo <kvalo@qca.qualcomm.com> wrote:
> Bartosz Markowski <bartosz.markowski@tieto.com> writes:
>
>> This is a workaround for HT-enabled STAs which break the spec
>> and have no HT capabilities RX mask (no HT RX MCS map).
>>
>> As per spec, in section 20.3.5 Modulation and coding scheme (MCS),
>> MCS 0 through 7 are mandatory in 20MHz with 800 ns GI at all STAs.
>>
>> Firmware asserts if such situation occurs.
>>
>> Signed-off-by: Bartosz Markowski <bartosz.markowski@tieto.com>
>
> This conflicted with Marek K's patch "ath10k: Set proper nss value for
> the peer". Please check that my resolution in ath-next-test is correct:
>
> https://github.com/kvalo/ath/commit/d56aa0e779c17f8048a70a9dbd5228b54d9a712e

Looks good.

-- 
Bartosz

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
