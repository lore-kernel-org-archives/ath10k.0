Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-wm0-x22e.google.com ([2a00:1450:400c:c09::22e])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1ceQWs-0004Il-Jb
 for ath10k@lists.infradead.org; Thu, 16 Feb 2017 18:11:45 +0000
Received: by mail-wm0-x22e.google.com with SMTP id r141so21679501wmg.1
 for <ath10k@lists.infradead.org>; Thu, 16 Feb 2017 10:11:20 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <a1743d94-25bb-b273-6626-dbb283479540@quicksilver.com>
References: <a1743d94-25bb-b273-6626-dbb283479540@quicksilver.com>
From: Adrian Chadd <adrian@freebsd.org>
Date: Thu, 16 Feb 2017 10:11:18 -0800
Message-ID: <CAJ-VmomjtZcp4SSRBbRT5Qa19EjEg-j9Y2cJ_Q_k6S97M+nuKw@mail.gmail.com>
Subject: Re: Does ath10k's spectral scan support I/Q or phase-magnitude?
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
To: Michael Everett Feder <mfeder@quicksilver.com>
Cc: "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

hiya,

I'll go double check. I think it's the same as ath9k hardware..


-a


On 2 February 2017 at 11:21, Michael Everett Feder
<mfeder@quicksilver.com> wrote:
> I understand that both the ath9k and the ath10k drivers support a spectral
> scan feature with an FFT output. But the ath9k's output only lists the
> magnitudes of each frequency bin, and doesn't seem to support
> in-phase/quadrature (I/Q) or phase-magnitude output. I was wondering if the
> ath10k driver's spectral scan supports an I/Q or phase-magnitude output or,
> like ath9k, it just supports magnitude only?
>
>
> _______________________________________________
> ath10k mailing list
> ath10k@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/ath10k

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
