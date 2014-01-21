Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-la0-x22d.google.com ([2a00:1450:4010:c03::22d])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1W5aQz-0003yS-Kj
 for ath10k@lists.infradead.org; Tue, 21 Jan 2014 12:28:02 +0000
Received: by mail-la0-f45.google.com with SMTP id b8so6510376lan.18
 for <ath10k@lists.infradead.org>; Tue, 21 Jan 2014 04:27:36 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <874n68g5td.fsf@kamboji.qca.qualcomm.com>
References: <1386858261-16037-1-git-send-email-michal.kazior@tieto.com>
 <874n68g5td.fsf@kamboji.qca.qualcomm.com>
Date: Tue, 21 Jan 2014 13:27:35 +0100
Message-ID: <CADnKcVhYqO-0+_9rN07YZyinjsfdnNnn8ix8FgX457vUw_TWRQ@mail.gmail.com>
Subject: Re: [PATCH 0/3] ath10k: fix host corruption
From: Marek Puzyniak <marek.puzyniak@tieto.com>
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
Cc: "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, Michal Kazior <michal.kazior@tieto.com>, ath10k@lists.infradead.org

On 16 December 2013 16:43, Kalle Valo <kvalo@qca.qualcomm.com> wrote:
> Michal Kazior <michal.kazior@tieto.com> writes:
>
>> This patchset aims at fixing (or at least
>> reducing) the frequency of a (apparently) strange
>> HW bug.
>>
>> The bug happens in some workloads with different
>> frequency with different hardware spinoffs. It is
>> triggered by a cold reset after HW/FW has been
>> excercised with some work.
>>
>> On x86 this could be a hang, on AP135 it is a data
>> bus error.
>>
>>
>> Michal Kazior (3):
>>   ath10k: fix device initialization routine
>>   ath10k: zero device DRAM to avoid host hangs
>>   ath10k: zero CE config upon deinit
>
> Let's put these patches on hold for now while we investigate more about
> this problem.
>
> --
> Kalle Valo
>
> _______________________________________________
> ath10k mailing list
> ath10k@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/ath10k

Kalle, please drop these patches. There will be new version of this patch-set.

Marek

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
