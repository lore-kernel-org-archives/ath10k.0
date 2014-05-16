Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-la0-x233.google.com ([2a00:1450:4010:c03::233])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WlMBS-0005fU-7v
 for ath10k@lists.infradead.org; Fri, 16 May 2014 17:44:38 +0000
Received: by mail-la0-f51.google.com with SMTP id gf5so2200232lab.38
 for <ath10k@lists.infradead.org>; Fri, 16 May 2014 10:44:14 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <874n0p7v6a.fsf@kamboji.qca.qualcomm.com>
References: <1400178923-26306-1-git-send-email-greearb@candelatech.com>
 <874n0p7v6a.fsf@kamboji.qca.qualcomm.com>
Date: Fri, 16 May 2014 19:44:14 +0200
Message-ID: <CALhHN=pf0Tw3rkip_LiQe0=EcLHD-u1yCVXsxLA-8VfpRqPy3A@mail.gmail.com>
Subject: Re: [PATCH] ath10k: Ensure rx-frag ignores rssi.
From: Janusz Dziedzic <janusz.dziedzic@tieto.com>
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
Cc: Ben Greear <greearb@candelatech.com>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

On 16 May 2014 14:41, Kalle Valo <kvalo@qca.qualcomm.com> wrote:
> greearb@candelatech.com writes:
>
>> From: Ben Greear <greearb@candelatech.com>
>>
>> It seems ath10k firmware gives us no way to know
>> the rssi for rx-fragments.
>>
>> Signed-off-by: Ben Greear <greearb@candelatech.com>
>
> Janusz, are you ok with this?
>
Yes this one is OK :)

BR
Janusz

>> Patch is against my tree, hopefully will apply OK against upstream
>> but have not tested that yet.
>
> Perfect, thanks for telling me this. Then I can just drop the patch if
> it doesn't apply. Oh, and it did apply cleanly to ath-next-test.
>
> --
> Kalle Valo
>
> _______________________________________________
> ath10k mailing list
> ath10k@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/ath10k

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
