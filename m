Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-lj1-f194.google.com ([209.85.208.194])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gmwtt-0004SF-Ux
 for ath10k@lists.infradead.org; Fri, 25 Jan 2019 08:31:47 +0000
Received: by mail-lj1-f194.google.com with SMTP id q2-v6so7642863lji.10
 for <ath10k@lists.infradead.org>; Fri, 25 Jan 2019 00:31:44 -0800 (PST)
From: Toke =?utf-8?Q?H=C3=B8iland-J=C3=B8rgensen?= <toke@redhat.com>
Subject: Re: [PATCH v6 4/4] ath10k: reporting estimated tx airtime for fairness
In-Reply-To: <CA+iem5vnADN5YSvsts8sBO=_4yNE62E3roySHz5hU6OqNke-6A@mail.gmail.com>
References: <20190122142019.21417-1-toke@redhat.com>
 <20190122142019.21417-5-toke@redhat.com>
 <CA+iem5vnADN5YSvsts8sBO=_4yNE62E3roySHz5hU6OqNke-6A@mail.gmail.com>
Date: Fri, 25 Jan 2019 09:31:41 +0100
Message-ID: <874l9xcf4i.fsf@toke.dk>
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
To: Kan Yan <kyan@google.com>
Cc: make-wifi-fast@lists.bufferbloat.net, linux-wireless@vger.kernel.org, ath10k@lists.infradead.org, Rajkumar Manoharan <rmanohar@codeaurora.org>

Kan Yan <kyan@google.com> writes:

> Hi Toke,
>
> This patch looks good to me. Great job on getting the airtime fairness
> scheduling framework done!

Great, thanks for checking! Have another patch to test on top of this
series, then we should look into getting the airtime queue limit patch
into mac80211 as well :)

-Toke

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
