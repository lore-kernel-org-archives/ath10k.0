Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-wr0-x231.google.com ([2a00:1450:400c:c0c::231])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1eyhGI-00076F-5I
 for ath10k@lists.infradead.org; Wed, 21 Mar 2018 17:10:56 +0000
Received: by mail-wr0-x231.google.com with SMTP id u46so5949421wrc.11
 for <ath10k@lists.infradead.org>; Wed, 21 Mar 2018 10:10:42 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <e2cedf15-050b-7853-8651-97e4f3e4760d@candelatech.com>
References: <C8E19707-2E18-4EBE-A83F-8F9A5CC8C86E@gmail.com>
 <760892ee-c949-b0e4-fdb7-93859f753691@candelatech.com>
 <CAJsuzOXKb2Q40PCb5=FbU6BSePVUH9yBSVaf-8UXDtfVnHuScA@mail.gmail.com>
 <e2cedf15-050b-7853-8651-97e4f3e4760d@candelatech.com>
From: Adrian Chadd <adrian@freebsd.org>
Date: Wed, 21 Mar 2018 10:10:38 -0700
Message-ID: <CAJ-Vmono5n1DhFw84vuCddPeFsWiqEpQkAQJq4NhmXOxWeOtzQ@mail.gmail.com>
Subject: Re: [ath10k] not working in 64 bit with >2GB Ram
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
Cc: ath10k@lists.infradead.org, paresh chaudhary <chaudharyparesh1986@gmail.com>

Hi,

I don't recall there being any issues with physical memory addresses
that high. I'd ask the vendor to help you with the DMA mapping side of
things and see what the deal is.

Is fbff7000 an actual valid return or is it some error return? the
ath10k firmware/copy-engine cares about that bit and I"m pretty sure
it should work (but I don't have the time/energy to try!).



-adrian

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
