Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-bk0-x22b.google.com ([2a00:1450:4008:c01::22b])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1V08ao-0004nV-CU
 for ath10k@lists.infradead.org; Fri, 19 Jul 2013 11:11:29 +0000
Received: by mail-bk0-f43.google.com with SMTP id jm2so1579948bkc.30
 for <ath10k@lists.infradead.org>; Fri, 19 Jul 2013 04:10:52 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <871u6u4xkk.fsf@kamboji.qca.qualcomm.com>
References: <1374129193-3533-1-git-send-email-michal.kazior@tieto.com>
 <871u6u4xkk.fsf@kamboji.qca.qualcomm.com>
Date: Fri, 19 Jul 2013 13:10:52 +0200
Message-ID: <CA+BoTQna=a66_g+_WG8mnENEDEiUcAysa-joeP-xmTM+mYfY=Q@mail.gmail.com>
Subject: Re: [PATCH 0/3] ath10k: fixes
From: Michal Kazior <michal.kazior@tieto.com>
List-Id: <ath10k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="iso-8859-2"
Content-Transfer-Encoding: quoted-printable
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+kvalo=adurom.com@lists.infradead.org
To: Kalle Valo <kvalo@qca.qualcomm.com>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

On 19 July 2013 13:07, Kalle Valo <kvalo@qca.qualcomm.com> wrote:
> Michal Kazior <michal.kazior@tieto.com> writes:
>
>> Hi,
>>
>> Here are some fixes for ath10k. The rts threshold
>> patch addresses my mistake in commit
>> 9aeb6fe53d1f0d6e58658484ce9ad7b59f0ef16b which
>> caused rts to be always enabled causing throughput
>> issues in some cases.
>>
>>
>> Michal Kazior (3):
>>   ath10k: prevent HTC from being used after stopping
>>   ath10k: fix memleak in mac setup
>>   ath10k: fix rts/fragmentation threshold setup
>
> Doesn't apply:
>
> Applying: ath10k: prevent HTC from being used after stopping
> Applying: ath10k: fix memleak in mac setup
> Applying: ath10k: fix rts/fragmentation threshold setup
> fatal: sha1 information is lacking or useless (drivers/net/wireless/ath/a=
th10k/mac.c).
> Repository lacks necessary blobs to fall back on 3-way merge.
> Cannot fall back to three-way merge.
> Patch failed at 0003 ath10k: fix rts/fragmentation threshold setup

Eww. Sorry about that (I did warn you though). Perhaps that's because
you skipped one of the recovery patches that git is confused now.

I'll resend the whole patchset rebased and with the HTC patch fixed.


Pozdrawiam / Best regards,
Micha=B3 Kazior.

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
