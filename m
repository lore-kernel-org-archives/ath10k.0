Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-vc0-x236.google.com ([2607:f8b0:400c:c03::236])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Wkh0I-0005Ko-BY
 for ath10k@lists.infradead.org; Wed, 14 May 2014 21:46:22 +0000
Received: by mail-vc0-f182.google.com with SMTP id la4so3303215vcb.13
 for <ath10k@lists.infradead.org>; Wed, 14 May 2014 14:45:59 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CAJ-Vmo=U4+XbLbinhmWCVPwXrKP98dmQUZGt+mYNnJwYCZdU4A@mail.gmail.com>
References: <CAHqTa-3YUpt3jByNxiEkPGV52CoRDS-R4W33ywKVLa-Ye9d2bQ@mail.gmail.com>
 <53703B61.3050305@candelatech.com>
 <CAHqTa-3Rj-=4A3BoQoD0fb7P=jDd53KvGjxW_BnkoF_+hdWW5g@mail.gmail.com>
 <53704888.9060602@candelatech.com>
 <CAHqTa-2sG0wDVaGQVkVcPezArA=OGT+35s_GU+5AmV0TQOau7w@mail.gmail.com>
 <537056B1.6060902@candelatech.com>
 <CAHqTa-1DwKqeSQD5FwOomyhqHv1THWD__0pnEs3RktOigp70kw@mail.gmail.com>
 <CAHqTa-2y9n3AxdN--QGqGW-HRZnrBwEOhujWZ4FNZKmpU+kHMQ@mail.gmail.com>
 <CAJ-Vmon6xP25Ah_sSgVJRWNs53+Xs_3BxwO=FpCmHKr0iC2Ahg@mail.gmail.com>
 <CAJ-Vmo=U4+XbLbinhmWCVPwXrKP98dmQUZGt+mYNnJwYCZdU4A@mail.gmail.com>
From: Avery Pennarun <apenwarr@gmail.com>
Date: Wed, 14 May 2014 17:45:39 -0400
Message-ID: <CAHqTa-2WpP4gttt5Oy2BOr9b4stSzDzUMQ=eM8FbJqETKKeSiw@mail.gmail.com>
Subject: Re: Unicast packets stop being transmitted to a particular station,
 under load, when WPA2 is enabled
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
To: Adrian Chadd <adrian@freebsd.org>
Cc: Ben Greear <greearb@candelatech.com>, ath10k <ath10k@lists.infradead.org>

On Wed, May 14, 2014 at 4:46 PM, Adrian Chadd <adrian@freebsd.org> wrote:
> It'd be nice to see TID 3 traffic -before- it negotiates the ADDBA,
> just to see what the heck is going on there.

I'd have to re-check the big trace you're looking at, but at least in
my new one from today, it actually does the ADDBA before *any* traffic is
sent on TID=3.

The IV being different from what it should be definitely sounds like
something that would explain the odd behaviour of wireshark being able
to decode it, but MacOS rejecting it.  I guess MacOS could be
rejecting unexpected IVs to avoid replay attacks.

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
