Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine02.qualcomm.com ([199.106.114.251])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XhIkS-00050P-Ol
 for ath10k@lists.infradead.org; Thu, 23 Oct 2014 13:48:17 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH v2 0/3] ath10k: speed up recovery
References: <1413807758-30249-1-git-send-email-michal.kazior@tieto.com>
 <CA+BoTQkrUQ6T60qztMuBbjy=vU-4Cho+yBXS051W=fNRTgNeig@mail.gmail.com>
Date: Thu, 23 Oct 2014 16:47:31 +0300
In-Reply-To: <CA+BoTQkrUQ6T60qztMuBbjy=vU-4Cho+yBXS051W=fNRTgNeig@mail.gmail.com>
 (Michal Kazior's message of "Thu, 23 Oct 2014 15:20:28 +0200")
Message-ID: <87k33qq4ng.fsf@kamboji.qca.qualcomm.com>
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
Cc: linux-wireless <linux-wireless@vger.kernel.org>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

Michal Kazior <michal.kazior@tieto.com> writes:

> On 20 October 2014 14:22, Michal Kazior <michal.kazior@tieto.com> wrote:
>> Patch #1 fixes a bug I've found while testing
>> patches #2 and #3. It's safe to cherry-pick it in
>> case patches #2 and/or #3 aren't accepted or need
>> a re-spin.
>>
>> I've mainly used patch #2 to test reset and
>> recovery. It's pretty handy for (stress-)testing.
>>
>> Patch #3 should improve recovery speed in some
>> cases. Notably when there's a long chain of WMI
>> commands involved which take a painfully long time
>> to timeout/complete if firmware crashes mid-way.
>>
>> Note: Patches #2 and #3 depend on `ath10k: pci
>> related fixes 2014-10-09`. Without the patchset
>> patches #2 and #3 must not be applied. Patch #1 is
>> fine though.
>
> Do not apply this patchset yet, please. I need to do a minor fix in
> the 'ath10k: fix possible bmi crash' regarding warm reset patch from
> the other patchset.

Ok, I'm dropping these and will wait for v3.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
