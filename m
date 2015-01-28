Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-ie0-x233.google.com ([2607:f8b0:4001:c03::233])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YGRAy-0000y5-3g
 for ath10k@lists.infradead.org; Wed, 28 Jan 2015 11:52:52 +0000
Received: by mail-ie0-f179.google.com with SMTP id x19so21163077ier.10
 for <ath10k@lists.infradead.org>; Wed, 28 Jan 2015 03:52:30 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <87wq4788p3.fsf@kamboji.qca.qualcomm.com>
References: <1422441092-29243-1-git-send-email-helmut.schaa@googlemail.com>
 <87wq4788p3.fsf@kamboji.qca.qualcomm.com>
Date: Wed, 28 Jan 2015 12:52:27 +0100
Message-ID: <CAGXE3d-Bt8e-jB+8nsh8rMxviKQFhrWZumudHX12r4+y=5+DzA@mail.gmail.com>
Subject: Re: [PATCH] ath10k: Use TX cksum offload only for CHECKSUM_PARTIAL
From: Helmut Schaa <helmut.schaa@googlemail.com>
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
Cc: Michal Kazior <michal.kazior@tieto.com>, ath10k@lists.infradead.org

On Wed, Jan 28, 2015 at 12:07 PM, Kalle Valo <kvalo@qca.qualcomm.com> wrote:
> Helmut Schaa <helmut.schaa@googlemail.com> writes:
>
>> Otherwise ath10k will just checksum everything even if it did not
>> go through the TCP/IP stack (for example bridged frames). In the worst
>> case this could mean recreating the checksum for incorrect data.
>>
>> Signed-off-by: Helmut Schaa <helmut.schaa@googlemail.com>
>
> In the future, please also CC linux-wireless. We get good review
> comments that way.

Ok, will do next time :)
Helmut

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
