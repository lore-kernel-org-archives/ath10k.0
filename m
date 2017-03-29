Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-wr0-x236.google.com ([2a00:1450:400c:c0c::236])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1ctGFD-00029B-Q1
 for ath10k@lists.infradead.org; Wed, 29 Mar 2017 16:14:49 +0000
Received: by mail-wr0-x236.google.com with SMTP id w43so22022280wrb.0
 for <ath10k@lists.infradead.org>; Wed, 29 Mar 2017 09:14:26 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CALJ2kaEWrUcMGGdPv1KB7-ajMs0c+WQ_rjLM_2BFni4ksXXrpQ@mail.gmail.com>
References: <CALJ2kaGBUyjtDDNQj-rLDK-J--ObZ+e5P_KVkaZfa4UtYUUMdQ@mail.gmail.com>
 <05ddc8a7-2abe-200b-bc70-15f674579d80@qca.qualcomm.com>
 <CALJ2kaEWrUcMGGdPv1KB7-ajMs0c+WQ_rjLM_2BFni4ksXXrpQ@mail.gmail.com>
From: Adrian Chadd <adrian@freebsd.org>
Date: Wed, 29 Mar 2017 09:14:24 -0700
Message-ID: <CAJ-Vmok-E8q1WCFmHUo+A5+K7v=V0ePULknX1Yfet5LTjc97zw@mail.gmail.com>
Subject: Re: QCA6174 ACS failure on first attempt
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
To: Chris Price <chris.price@dejero.com>
Cc: "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

Hi,

Isn't this because by default the world regulatory domain the stack is
in marks all 5GHz channels as NO-IR, and wants to hear beacons before
it determines it can use 5G channels?

We've had to port the openwrt/qsdk changes that allow for the
regdomain to be set rather than it defaulting to world and NO-IR on
all 5GHz channels. Then it works (save 40/80mhz oddness with ACS,
dunno that yet...)



-adrian

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
