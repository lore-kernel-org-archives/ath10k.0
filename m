Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-vc0-x22d.google.com ([2607:f8b0:400c:c03::22d])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XNHEG-00057H-Pd
 for ath10k@lists.infradead.org; Fri, 29 Aug 2014 08:08:17 +0000
Received: by mail-vc0-f173.google.com with SMTP id im17so2089117vcb.32
 for <ath10k@lists.infradead.org>; Fri, 29 Aug 2014 01:07:55 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CA+BoTQmLa9NRR0oL=GeTX7TRnYCEYyFnLZ7_m8CAwW_WAABwvA@mail.gmail.com>
References: <1408693965-29858-1-git-send-email-michal.kazior@tieto.com>
 <CAEFj986a+=EvXGL62TjnjRtB6uUu=NppcYpJTBJj9gDZhsUhCA@mail.gmail.com>
 <CA+BoTQmLa9NRR0oL=GeTX7TRnYCEYyFnLZ7_m8CAwW_WAABwvA@mail.gmail.com>
Date: Fri, 29 Aug 2014 16:07:55 +0800
Message-ID: <CAEFj985gNJXyr2+Pz1vOYCE67XzCyBSLaSZdq5=aM02UJBmAqQ@mail.gmail.com>
Subject: Re: [RFC] ath10k: use raw tx
From: Yeoh Chun-Yeow <yeohchunyeow@gmail.com>
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
Cc: "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

>
> Also, with raw tx in ath10k you can probably try playing with mesh
> because QoS Control is no longer stripped, right?
>
Yes. This is one of the issues.

--------
ChunYeow

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
