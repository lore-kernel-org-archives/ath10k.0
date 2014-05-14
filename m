Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-qc0-x235.google.com ([2607:f8b0:400d:c01::235])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Wkg58-0000Fw-4d
 for ath10k@lists.infradead.org; Wed, 14 May 2014 20:47:18 +0000
Received: by mail-qc0-f181.google.com with SMTP id m20so210708qcx.12
 for <ath10k@lists.infradead.org>; Wed, 14 May 2014 13:46:56 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CAJ-Vmon6xP25Ah_sSgVJRWNs53+Xs_3BxwO=FpCmHKr0iC2Ahg@mail.gmail.com>
References: <CAHqTa-3YUpt3jByNxiEkPGV52CoRDS-R4W33ywKVLa-Ye9d2bQ@mail.gmail.com>
 <53703B61.3050305@candelatech.com>
 <CAHqTa-3Rj-=4A3BoQoD0fb7P=jDd53KvGjxW_BnkoF_+hdWW5g@mail.gmail.com>
 <53704888.9060602@candelatech.com>
 <CAHqTa-2sG0wDVaGQVkVcPezArA=OGT+35s_GU+5AmV0TQOau7w@mail.gmail.com>
 <537056B1.6060902@candelatech.com>
 <CAHqTa-1DwKqeSQD5FwOomyhqHv1THWD__0pnEs3RktOigp70kw@mail.gmail.com>
 <CAHqTa-2y9n3AxdN--QGqGW-HRZnrBwEOhujWZ4FNZKmpU+kHMQ@mail.gmail.com>
 <CAJ-Vmon6xP25Ah_sSgVJRWNs53+Xs_3BxwO=FpCmHKr0iC2Ahg@mail.gmail.com>
Date: Wed, 14 May 2014 13:46:56 -0700
Message-ID: <CAJ-Vmo=U4+XbLbinhmWCVPwXrKP98dmQUZGt+mYNnJwYCZdU4A@mail.gmail.com>
Subject: Re: Unicast packets stop being transmitted to a particular station,
 under load, when WPA2 is enabled
From: Adrian Chadd <adrian@freebsd.org>
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
To: Avery Pennarun <apenwarr@gmail.com>
Cc: Ben Greear <greearb@candelatech.com>, ath10k <ath10k@lists.infradead.org>

ok, so I've taken a 30 second look.

The CCMP IV's used for TID 3 look creepy. They start at 0x300000000000
and go up. It's much higher than the rest of the IVs used for
transmitting on the other TIDs.

It'd be nice to see TID 3 traffic -before- it negotiates the ADDBA,
just to see what the heck is going on there.

What _should_ be happening!

* transmitting to a station should have exactly one CCMP IV, shared
across all frames being transmitted. It should be allocated in order,
regardless of the TID
* on the receiving side, there's tracking for the CCMP IV seen for
each TID, and checked to avoid replay attacks.

It's choosing a totally different CCMP IV space for transmitting on
TID 3. I don't know why.

(And I still don't have firmware source, so I can't tell you yet. grr.)

Ben - I'm punting this one to you!




-a

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
