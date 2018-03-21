Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-wr0-x229.google.com ([2a00:1450:400c:c0c::229])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1eyhI1-0007LM-Fi
 for ath10k@lists.infradead.org; Wed, 21 Mar 2018 17:12:43 +0000
Received: by mail-wr0-x229.google.com with SMTP id f14so5962414wre.8
 for <ath10k@lists.infradead.org>; Wed, 21 Mar 2018 10:12:30 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CAJ-Vmono5n1DhFw84vuCddPeFsWiqEpQkAQJq4NhmXOxWeOtzQ@mail.gmail.com>
References: <C8E19707-2E18-4EBE-A83F-8F9A5CC8C86E@gmail.com>
 <760892ee-c949-b0e4-fdb7-93859f753691@candelatech.com>
 <CAJsuzOXKb2Q40PCb5=FbU6BSePVUH9yBSVaf-8UXDtfVnHuScA@mail.gmail.com>
 <e2cedf15-050b-7853-8651-97e4f3e4760d@candelatech.com>
 <CAJ-Vmono5n1DhFw84vuCddPeFsWiqEpQkAQJq4NhmXOxWeOtzQ@mail.gmail.com>
From: Adrian Chadd <adrian@freebsd.org>
Date: Wed, 21 Mar 2018 10:12:26 -0700
Message-ID: <CAJ-VmokwZYrkgU=3vMYZTy0ZQ9erXCANP0xXPYxj=tCOOZoO8g@mail.gmail.com>
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

Sorry, a quick follow-up:

I bring it up because I know there's some oddness with the PPC IOMMU
and where they put their devices in the physical address map, so you
have to do a lot of gymnastics to be able to even access devices.
Anything above 32 bit boundary requires that they do a temporary IOMMU
mapping OR they have to use a bounce buffer in memory < 4G. So that
whole side of things needs to be setup correctly on the Linux BSP side
of things for the dma map/unmap calls to do the right thing.



-adrian

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
