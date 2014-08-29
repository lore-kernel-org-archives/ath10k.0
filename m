Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-vc0-x234.google.com ([2607:f8b0:400c:c03::234])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XNGP7-0002dH-3a
 for ath10k@lists.infradead.org; Fri, 29 Aug 2014 07:15:25 +0000
Received: by mail-vc0-f180.google.com with SMTP id lf12so2051079vcb.39
 for <ath10k@lists.infradead.org>; Fri, 29 Aug 2014 00:15:02 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1408693965-29858-1-git-send-email-michal.kazior@tieto.com>
References: <1408693965-29858-1-git-send-email-michal.kazior@tieto.com>
Date: Fri, 29 Aug 2014 15:15:02 +0800
Message-ID: <CAEFj986a+=EvXGL62TjnjRtB6uUu=NppcYpJTBJj9gDZhsUhCA@mail.gmail.com>
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

Hi, Michal

On Fri, Aug 22, 2014 at 3:52 PM, Michal Kazior <michal.kazior@tieto.com> wrote:
> This is just a reference for anyone interested in
> getting injection working with ath10k.
>
> This just switches to raw tx mode instead of nwifi
> for regular operation. Injection doesn't work yet.
>
> I've tested this on 999.999.0.636, 10.1.467.2-1
> and 10.2-00082-4. The 10.1.467.2-1 crashes as soon
> as first tx completion comes in. The other two
> seem to work but don't work with A-MSDU so it is
> necessary to disable it:

Packet injection requires monitor mode, am I right? Firmware
999.999.0.636 has no monitor mode support, am I right?

----
ChunYeow

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
