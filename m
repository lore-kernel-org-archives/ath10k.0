Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from [208.74.158.174] (helo=mail3.candelatech.com)
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hSoMT-00079J-Su
 for ath10k@lists.infradead.org; Mon, 20 May 2019 19:54:19 +0000
Subject: Re: Problem with 9984 in routed mode with 512b frames.
References: <e11b8d7f-bc28-bc66-fb8c-ff4db22d7c46@candelatech.com>
 <daaad6d3-cf60-4ddc-af20-279a0cbbbe0c@newmedia-net.de>
 <10ed4e39-4364-c8ef-2b38-15ea7672ad94@candelatech.com>
 <2ec6f626-6391-f9b5-918c-99ad7e6b3e31@newmedia-net.de>
 <ad97576c-d6dd-e29c-10d4-00b8aff77805@candelatech.com>
 <55b50a9a-49f4-d669-22d4-84e2efabf451@candelatech.com>
 <2ef800e2-5ce6-f579-ded5-65dc82827e4d@newmedia-net.de>
 <cdfa7b09-4e32-a62d-1bb6-d6128ba6594b@candelatech.com>
 <eae17245-eec2-96fe-34ff-f3800fae44d8@newmedia-net.de>
 <CAJ-Vmo=xhBvLmzec5mzf-gcFm1h6cQBLUOdVhuQjvbUWFjP-AQ@mail.gmail.com>
 <6378a260-0441-b985-6421-091f46d871f5@candelatech.com>
 <3d1db9ca-92a0-2bf7-5608-54e2b8e0476f@newmedia-net.de>
 <CAJ-VmonsmNVhzge5jiOVhJn13B8oWEop8zr=Xk+dgYZDTaGU+Q@mail.gmail.com>
From: Ben Greear <greearb@candelatech.com>
Message-ID: <41a3c98c-4cea-3d85-cc70-d153d18dc672@candelatech.com>
Date: Mon, 20 May 2019 12:54:16 -0700
MIME-Version: 1.0
In-Reply-To: <CAJ-VmonsmNVhzge5jiOVhJn13B8oWEop8zr=Xk+dgYZDTaGU+Q@mail.gmail.com>
Content-Language: en-US
List-Id: <ath10k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+kvalo=adurom.com@lists.infradead.org
To: Adrian Chadd <adrian@freebsd.org>, Sebastian Gottschall <s.gottschall@newmedia-net.de>
Cc: ath10k <ath10k@lists.infradead.org>

On 5/20/19 12:25 PM, Adrian Chadd wrote:
> On Mon, 20 May 2019 at 09:59, Sebastian Gottschall
> <s.gottschall@newmedia-net.de> wrote:
> 
> 
>> the curious thing is still that the fallback code applies only for 2.4
>> ghz so it would never have affected 802.11ac
> 
> Hm, does RC fall back to 11na or 11a rates when doing 11ac? (in 5G
> mode.) It's good to know fixing that would fix it in 2.4GHz operation
> but yeah, I wonder about RC in 5G.

It appears the rate-ctrl tries to fall to CCK 2Mbps or 1Mbps and skips a/g rates.  /n
rates are a subset of VHT, so those are used as part of normal VHT rate-ctrl.

I have no explanation for why I saw the tx-hang in stock-ish firmware, which indeed
should not have tried to use any a/g rates in 5Ghz.  The high-level failure looked exactly like
what I eventually debugged as falling back to /a rates in my firmware, for what that
is worth.

Thanks,
Ben

-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
