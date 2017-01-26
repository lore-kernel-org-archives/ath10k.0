Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-wm0-f53.google.com ([74.125.82.53])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cWXa9-0006wm-4e
 for ath10k@lists.infradead.org; Thu, 26 Jan 2017 00:06:30 +0000
Received: by mail-wm0-f53.google.com with SMTP id r144so58330834wme.1
 for <ath10k@lists.infradead.org>; Wed, 25 Jan 2017 16:06:07 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <BLUPR06MB8682BCD53C888879F9B4E68E0740@BLUPR06MB868.namprd06.prod.outlook.com>
References: <BLUPR06MB868ABBAAB6D6107EECB885FE0740@BLUPR06MB868.namprd06.prod.outlook.com>
 <BLUPR06MB8682BCD53C888879F9B4E68E0740@BLUPR06MB868.namprd06.prod.outlook.com>
From: Adrian Chadd <adrian@freebsd.org>
Date: Wed, 25 Jan 2017 16:05:05 -0800
Message-ID: <CAJ-Vmokm1ZYJUfEcwvg49Q3v=G6c=TVnfSsAn-+BgcPHZ+muOg@mail.gmail.com>
Subject: Re: ath10k + OpenWRT + ath10k firmware 10.2.2.60.14 - Crash
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
To: Kevin Dious <Kevin.Dious@ubiqomm.com>
Cc: "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

Hiya,

Can you enable WMI/MAC debugging when you load it up? Knowing which
command(s) it's sent before it does would be helpful.

It'd also be useful to know if it's something silly, like it thinking
it's a 2G device when QCA9888 is definitely 5G...


-a

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
