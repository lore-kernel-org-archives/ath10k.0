Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail.candelatech.com ([208.74.158.172] helo=ns3.lanforge.com)
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WSDFA-0005W4-18
 for ath10k@lists.infradead.org; Mon, 24 Mar 2014 22:21:20 +0000
Message-ID: <5330AFC6.60205@candelatech.com>
Date: Mon, 24 Mar 2014 15:20:54 -0700
From: Ben Greear <greearb@candelatech.com>
MIME-Version: 1.0
Subject: Re: [PATCH v2 2/2] ath10k: fix rssi and rate reporting
References: <1395692698-4745-1-git-send-email-janusz.dziedzic@tieto.com>
 <1395692698-4745-2-git-send-email-janusz.dziedzic@tieto.com>
In-Reply-To: <1395692698-4745-2-git-send-email-janusz.dziedzic@tieto.com>
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
To: Janusz Dziedzic <janusz.dziedzic@tieto.com>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

On 03/24/2014 01:24 PM, Janusz Dziedzic wrote:
> RSSI and RATES fields are valid only when START_VALID
> bit is set. So, in current implementation we have to
> remember/caclulate them when START_VALID and report the same
> when only END_VALID is set.
> Currently during heavy traffic we could have:
> - 10 packets with START_VALID - correct RSSI and RATES
> - 10 packets with END_VALID
> - 10 packets with START_VALID - correct RSSI and RATES
> - 10 packets with END_VALID

I applied all 8 of these patches to my tree, and it does fix the problems I saw with
rx-rate and signal being broken (perhaps because I am using raw rx mode for
my stations).

I'll leave these in my tree and will let you know if I see any
problems that might be related to them.

Thanks,
Ben

-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
