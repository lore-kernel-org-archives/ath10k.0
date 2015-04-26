Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-ig0-f178.google.com ([209.85.213.178])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YmNMW-0003CB-7x
 for ath10k@lists.infradead.org; Sun, 26 Apr 2015 14:16:48 +0000
Received: by igblo3 with SMTP id lo3so44479614igb.0
 for <ath10k@lists.infradead.org>; Sun, 26 Apr 2015 07:16:26 -0700 (PDT)
Date: Sun, 26 Apr 2015 10:15:53 -0400
From: Bob Copeland <me@bobcopeland.com>
Subject: Re: attempting mesh on ath10k
Message-ID: <20150426141552.GA25938@localhost>
References: <20150424125055.GA27722@localhost>
 <CAEFj986N0UnCnzFWLTd=MkSWRU0jOG36N4SVepkmXPnaLX__0g@mail.gmail.com>
 <553AEFFA.6010709@candelatech.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <553AEFFA.6010709@candelatech.com>
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
Cc: Yeoh Chun-Yeow <yeohchunyeow@gmail.com>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

On Fri, Apr 24, 2015 at 06:38:02PM -0700, Ben Greear wrote:
> I have IBSS support working, and at least non-encrypted raw transmit
> can work in my firmware, though raw tx requires Michal's RFC patch
> he posted some time ago.

(Michal's RFC patch is in my repo.)

So I got a bit further.  I was still getting a crash with CT firmware, but,
suspecting that we pass something invalid in assoc message for mesh, I forced
peer->aid = 1 and then it no longer crashes shortly after adding the first
peer on either CT or QCA firmware.

I pushed that hack into my repo for now -- I think we want to rethink how and
when AIDs are generated in mesh.

# iw dev wlan0 station dump
Station 00:03:7f:10:4e:2d (on wlan0)
        inactive time:  400 ms
        rx bytes:       34019
        rx packets:     959
        tx bytes:       152
        tx packets:     3
        tx retries:     0
        tx failed:      0
        signal:         -27 dBm
        signal avg:     -26 dBm
        tx bitrate:     6.0 MBit/s
        rx bitrate:     9.0 MBit/s
        mesh llid:      220
        mesh plid:      455
        mesh plink:     ESTAB
        mesh local PS mode:     ACTIVE
        mesh peer PS mode:      ACTIVE
        mesh non-peer PS mode:  ACTIVE
        authorized:     yes
        authenticated:  yes
        preamble:       long
        WMM/WME:        yes
        MFP:            no
        TDLS peer:      no

So, progress!

There's still an issue with datapath -- while it looks like we can establish
plinks, I couldn't get unicast traffic flowing even if manually setting up
mpaths and arp table entries.  I haven't yet got all of my 5 ghz capable gear
in the same room to monitor and see where the problem lies.

-- 
Bob Copeland %% http://bobcopeland.com/

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
