Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-it1-x143.google.com ([2607:f8b0:4864:20::143])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gwVJN-0003Mp-6J
 for ath10k@lists.infradead.org; Wed, 20 Feb 2019 17:05:34 +0000
Received: by mail-it1-x143.google.com with SMTP id v72so17289115itc.0
 for <ath10k@lists.infradead.org>; Wed, 20 Feb 2019 09:05:30 -0800 (PST)
Received: from hash (CPE30b5c2fb365b-CM18593342f28f.cpe.net.cable.rogers.com.
 [99.232.51.173])
 by smtp.gmail.com with ESMTPSA id w8sm1833737iob.34.2019.02.20.09.05.26
 for <ath10k@lists.infradead.org>
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 20 Feb 2019 09:05:26 -0800 (PST)
Received: from bob by hash with local (Exim 4.92-RC4)
 (envelope-from <me@bobcopeland.com>) id 1gwVJF-0008W4-Oa
 for ath10k@lists.infradead.org; Wed, 20 Feb 2019 12:05:25 -0500
Date: Wed, 20 Feb 2019 12:05:25 -0500
From: Bob Copeland <me@bobcopeland.com>
Subject: Re: [PATCH RFC] out-of-order frames
Message-ID: <20190220170525.GA28857@localhost>
References: <20190219202554.GA5065@localhost>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190219202554.GA5065@localhost>
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
To: ath10k@lists.infradead.org

On Tue, Feb 19, 2019 at 03:25:54PM -0500, Bob Copeland wrote:
>  - This is on a 4.14.94 kernel:
> 
> [   12.454034] ath10k_pci 0000:01:00.0: qca9984/qca9994 hw1.0 target 0x01000000 chip_id 0x00000000 sub 168c:cafe
> [   12.487148] ath10k_pci 0000:01:00.0: firmware ver 10.4-3.4-00104 api 5 features no-p2p,mfp,peer-flow-ctrl,btcoex-param,allows-mesh-bcast crc32 4317698a

Just a few follow-up observations:

 - seems specific to mesh mode; in AP mode I see, e.g.:

[ 7762.442026] XXX start rx ba session peer 2

...where that is a printk I added before we setup the session in mac80211.

 - newest firmware does not fix
 - addba requests are robust management frames and I was initially testing
   with pmf=1; however, I turned that off and it is still broken

-- 
Bob Copeland %% https://bobcopeland.com/

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
