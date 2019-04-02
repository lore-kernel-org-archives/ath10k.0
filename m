Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-io1-xd41.google.com ([2607:f8b0:4864:20::d41])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hBS1o-0001Qz-Ga
 for ath10k@lists.infradead.org; Tue, 02 Apr 2019 22:37:14 +0000
Received: by mail-io1-xd41.google.com with SMTP id x3so12379996iol.10
 for <ath10k@lists.infradead.org>; Tue, 02 Apr 2019 15:37:11 -0700 (PDT)
Date: Tue, 2 Apr 2019 18:37:09 -0400
From: Bob Copeland <me@bobcopeland.com>
Subject: Re: [PATCH v4 3/3] ath10k: add support for controlling tx power to a
 station
Message-ID: <20190402223709.GB8910@localhost>
References: <1553856587-21611-1-git-send-email-bpothuno@codeaurora.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1553856587-21611-1-git-send-email-bpothuno@codeaurora.org>
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
To: Balaji Pothunoori <bpothuno@codeaurora.org>
Cc: johannes@sipsolutions.net, Ashok Raj Nagarajan <arnagara@codeaurora.org>, linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

On Fri, Mar 29, 2019 at 04:19:47PM +0530, Balaji Pothunoori wrote:
> From: Ashok Raj Nagarajan <arnagara@codeaurora.org>
> 
> This patch will add the support to control the transmit power for traffic
> to a station associated with the AP.
> 
> Underlying firmware will enforce that the maximum tx power will be based
> on the regulatory requirements. If the user given transmit power is greater
> than the allowed tx power in the given channel, then the firmware will use
> the maximum tx power in the same channel.
> 
> When 0 is sent to the firmware as tx power, it will revert to the default
> tx power for the station.
> 
> Tested Hardware : QCA9984
> Tested Firmware : 10.4-3.9.0.1-00013

I tried this on qca9984 with 10.4-3.9.0.2-00040, which claims to support
this feature, and it didn't seem to work:

- with global tx power limit set to 30 dBm, I started an iperf from station
  A -> B

- while iperf underway, I did tcpdump on a monitor on B and looked at signal
  level in radiotap, in this case around -75 dBm

- on A, changed the per-sta txpwr limit for B to something (tried as low as
  1 dBm).  verified via printk that it went through to the driver / firmware
  command and reported no error
  -> result: signal level unchanged

- on A, changed the global tx power limit to 1 dBm
  -> result: signal level dropped to ~ -95 dBm

Reading the description above, now I'm wondering if the txpower is
max(sta-power,global-power)?  If so, that seems a bit unintuitive to me,
or at least isn't what I hoped for.  I'd prefer to have per-sta power
setting override the global power.

-- 
Bob Copeland %% https://bobcopeland.com/

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
