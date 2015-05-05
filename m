Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail1.g8.pair.com ([66.39.4.88])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YphKO-0002Id-S8
 for ath10k@lists.infradead.org; Tue, 05 May 2015 18:12:22 +0000
Mime-Version: 1.0 (Mac OS X Mail 8.2 \(2098\))
Subject: Re: Getting RSSI per antenna.
From: Michael Ney <neym@vorklift.com>
In-Reply-To: <BB63CF2605733841BD56CD9C38AC1F7E1F34E56E@MBX13.d.ethz.ch>
Date: Tue, 5 May 2015 14:11:46 -0400
Message-Id: <DB59F61F-8BFD-48C3-AD4C-BA566E5EC6AB@vorklift.com>
References: <BB63CF2605733841BD56CD9C38AC1F7E1F34E56E@MBX13.d.ethz.ch>
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
To: Costa Molero Edgar <cedgar@student.ethz.ch>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

Check the rx_ppdu_start structure in rx_desc.h. The per-antenna values are populated by the firmware into the rx descripter (verified), which is parsed in the function "ath10k_htt_rx_h_signal" in htt_rx.c. You would need to implement something similar to the method in the "ath9k_cmn_process_rssi" function from ath9k's common.c. Once you do that, you should be able to view the per-antenna RSSI in any tool that can parse the radiotap header such as wireshark, but you won't see it in iw or iwconfig. Also, you shouldn't be using iwconfig. It's deprecated.


> On May 5, 2015, at 1:30 PM, Costa Molero Edgar <cedgar@student.ethz.ch> wrote:
> 
> Hi guys,
> 
> Is there anyway I can get a separate RSSI for each one of the antennas ? I guess that the signal level reported by iwconfig is a combination, so it should be a way to get them separately. Is that functionality implemented or if not could some one tell me which variables from the driver contain that information ?
> 
> Thank you very much,
> 
> Rfhst
> _______________________________________________
> ath10k mailing list
> ath10k@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/ath10k


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
