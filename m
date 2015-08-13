Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth01.qualcomm.com ([65.197.215.72])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZPpqE-0004N5-CW
 for ath10k@lists.infradead.org; Thu, 13 Aug 2015 10:34:34 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: unknown qca6164 model 0x0041
References: <55CB9F9C.2000309@canonical.com>
 <CA+BoTQmhWxkN+d9XWA7af_R0q9FkDyfVTRLDZyvLSj=bW0fGZQ@mail.gmail.com>
Date: Thu, 13 Aug 2015 13:34:01 +0300
In-Reply-To: <CA+BoTQmhWxkN+d9XWA7af_R0q9FkDyfVTRLDZyvLSj=bW0fGZQ@mail.gmail.com>
 (Michal Kazior's message of "Thu, 13 Aug 2015 07:04:15 +0200")
Message-ID: <87zj1vo4ti.fsf@kamboji.qca.qualcomm.com>
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
Cc: 1436940@bugs.launchpad.net, Arnd Bergmann <arnd@arndb.de>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>, Joseph Salisbury <joseph.salisbury@canonical.com>

Michal Kazior <michal.kazior@tieto.com> writes:

> On 12 August 2015 at 21:33, Joseph Salisbury
> <joseph.salisbury@canonical.com> wrote:
>> Hello,
>>
>> There are still new folks reporting this issue in the Launchpad bug
>> report[0].  Has there been any progress on the firmware problem reported
>> in the comment by Kalle Valo on March 26, 2015[1]?
>>
>> Thanks in advance,
>
> Thanks for pinging.
>
> Recently we finally found a way to boot qca6164 with unofficial
> windows-extracted firmware images on ath10k[1]. We still don't have an
> official firmware release for qca61x4 family for ath10k though.

I just pushed the firmware here:

https://github.com/kvalo/ath10k-firmware/commit/7f7e7dda33676ced293de477b03711199ffe5256

Please let me know how it works (or not). And really sorry for taking so
long with this.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
