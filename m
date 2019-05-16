Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-wr1-f50.google.com ([209.85.221.50])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hRN6Z-0006JD-F8
 for ath10k@lists.infradead.org; Thu, 16 May 2019 20:35:56 +0000
Received: by mail-wr1-f50.google.com with SMTP id d9so4851331wrx.0
 for <ath10k@lists.infradead.org>; Thu, 16 May 2019 13:35:55 -0700 (PDT)
MIME-Version: 1.0
References: <e11b8d7f-bc28-bc66-fb8c-ff4db22d7c46@candelatech.com>
 <daaad6d3-cf60-4ddc-af20-279a0cbbbe0c@newmedia-net.de>
 <10ed4e39-4364-c8ef-2b38-15ea7672ad94@candelatech.com>
 <2ec6f626-6391-f9b5-918c-99ad7e6b3e31@newmedia-net.de>
 <ad97576c-d6dd-e29c-10d4-00b8aff77805@candelatech.com>
 <55b50a9a-49f4-d669-22d4-84e2efabf451@candelatech.com>
 <CAJ-Vmo=MgeKdUj+d7L6oJKfdSMb84D_nYHZ+BMSr6guB4Q_Y2Q@mail.gmail.com>
 <a41b74e9-230d-1094-cb86-3b105e602788@candelatech.com>
 <CAJ-VmokYa4LpQCokRu_7gp1LsV+-1fS=UmWd=6SZ07F-O5cw+w@mail.gmail.com>
 <958466d1-2d3a-d1cd-e1f6-65e032f15e15@candelatech.com>
In-Reply-To: <958466d1-2d3a-d1cd-e1f6-65e032f15e15@candelatech.com>
From: Adrian Chadd <adrian@freebsd.org>
Date: Thu, 16 May 2019 13:35:41 -0700
Message-ID: <CAJ-VmoksXc_f2R+acVCdLH0dtriv06cWYxw04v1Sq=ezHn-A1Q@mail.gmail.com>
Subject: Re: Problem with 9984 in routed mode with 512b frames.
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
To: Ben Greear <greearb@candelatech.com>
Cc: Sebastian Gottschall <s.gottschall@newmedia-net.de>, ath10k <ath10k@lists.infradead.org>

On Thu, 16 May 2019 at 13:20, Ben Greear <greearb@candelatech.com> wrote:
>
> On 5/16/19 1:16 PM, Adrian Chadd wrote:
> > You can't do AMPDU with OFDM/CCK. If they're setting the AMPDU bit
> > then that's wrong. it needs to be individual MPDU/PPDUs.
> >
> > There's a benefit for CCK. OFDM 6M is I think roughly the same as OFDM
> > MCS0. But CCK is a lot more reliable.
>
> 5Ghz can (should) not do CCK anyway.  Do you have any reference for why
> you think CCK will be better?  The one I found shows otherwise:
>
> https://d2cpnw0u24fjm4.cloudfront.net/wp-content/uploads/LaminatedCard_RevolutionWiFiMCStoSNRSinglePage.png

Well, you should try measuring it :-) I remember stories of decoding
CCK frames with MRC-CCK at an RSSI of 0 or -1...

And yes, you shouldn't do CCK on 5G, but some wifi PHYs do support it
("support" "it")...



-adrian

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
