Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine01.qualcomm.com ([199.106.114.254])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZrkkD-0005uW-2c
 for ath10k@lists.infradead.org; Thu, 29 Oct 2015 10:47:46 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH v2] ath10k: add FW API support to test mode
References: <20151020112513.14879.47438.stgit@potku.adurom.net>
 <5625E6BD.6020307@gmail.com>
 <CA+BoTQnSQmdCCqF43+Q5cxyVVLrM_BxRMT+Ydpfe6_5yRV2+Lw@mail.gmail.com>
 <56273D3F.6080804@gmail.com>
 <CA+BoTQ=y3-AmpTbpurCvEd2RxQHmMjbU+r7Gy57oz9LsC3VR1Q@mail.gmail.com>
Date: Thu, 29 Oct 2015 12:47:05 +0200
In-Reply-To: <CA+BoTQ=y3-AmpTbpurCvEd2RxQHmMjbU+r7Gy57oz9LsC3VR1Q@mail.gmail.com>
 (Michal Kazior's message of "Wed, 21 Oct 2015 09:28:08 +0200")
Message-ID: <87wpu6q7di.fsf@kamboji.qca.qualcomm.com>
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
Cc: linux-wireless <linux-wireless@vger.kernel.org>, Manikanta <manikanta.pubbisetty@gmail.com>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

Michal Kazior <michal.kazior@tieto.com> writes:

>> Hmmm, this way we will have a unified firmware parsing logic. Is this a task
>> which can be taken up easily or any other hidden complexities are invloved
>> ?.
>
> Decoupling the parsing logic should be rather easy. I don't think
> there are any gotchas.

I agree.

>> I mean can we do the changes for current parsing logic and then rework the
>> test mode patch ? what is your suggestion ?
>
> If you want to do the unified parsing logic approach you should first
> decouple the logic (i.e. make it not fill `struct ath10k` directly)
> and then rework the testmode patch on top of that.

Actually I prefer the other way around, I can first apply the test mode
patch and later someone can decouple the logic in a new patch. The code
size benefits that from all pretty small so I don't think it's sensible
to delay this patch. But decoupling the logic would be nice cleanup to
do.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
