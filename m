Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-ie0-f169.google.com ([209.85.223.169])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Yn55b-00057h-Jf
 for ath10k@lists.infradead.org; Tue, 28 Apr 2015 12:58:16 +0000
Received: by iedfl3 with SMTP id fl3so19250739ied.1
 for <ath10k@lists.infradead.org>; Tue, 28 Apr 2015 05:57:52 -0700 (PDT)
Date: Tue, 28 Apr 2015 08:57:49 -0400
From: Bob Copeland <me@bobcopeland.com>
Subject: Re: attempting mesh on ath10k
Message-ID: <20150428125748.GE4527@localhost>
References: <20150424125055.GA27722@localhost>
 <CAEFj986N0UnCnzFWLTd=MkSWRU0jOG36N4SVepkmXPnaLX__0g@mail.gmail.com>
 <20150428124116.GC4527@localhost>
 <CAEFj987sVTAn8ABk70AhtDcr2wA+RTH6eXKtgOk26h=pZ5A-JA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAEFj987sVTAn8ABk70AhtDcr2wA+RTH6eXKtgOk26h=pZ5A-JA@mail.gmail.com>
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
To: Yeoh Chun-Yeow <yeohchunyeow@gmail.com>
Cc: Ben Greear <greearb@candelatech.com>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

On Tue, Apr 28, 2015 at 08:50:01PM +0800, Chun-Yeow Yeoh wrote:
> Great works, Bob.
> 
> Which AP firmware that you have tested with?

That is with:

[   16.670000] ath10k_pci 0000:01:00.0: qca988x hw2.0 (0x4100016c,
0x043202ff) fw 10.2.4.45 api 4 htt 2.1 wmi 5 cal otp max_sta 128

I think it should work with CT too.  I need to go back and validate
that, and also make sure I can repro the AID crash on CT.  A confounding
factor is that every time I build new drivers for OpenWRT, it overwrites
the firmware again...

-- 
Bob Copeland %% http://bobcopeland.com/

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
