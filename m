Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1av6Dz-0001qI-Hn
 for ath10k@lists.infradead.org; Tue, 26 Apr 2016 16:52:35 +0000
Message-ID: <571F9C90.9040205@codeaurora.org>
Date: Tue, 26 Apr 2016 09:51:28 -0700
From: Peter Oh <poh@codeaurora.org>
MIME-Version: 1.0
Subject: Re: enable 802.11h and 802.11d in IBSS mode
References: <571F60DE.2010705@cttc.cat>
In-Reply-To: <571F60DE.2010705@cttc.cat>
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
To: "Jose Nunez-Martinez (CTTC)" <jose.nunez@cttc.cat>, ath10k@lists.infradead.org


On 04/26/2016 05:36 AM, Jose Nunez-Martinez (CTTC) wrote:
> Hi all,
> I'm using ath10k in IBSS with 2 wireless cards based on qca988x.
> How can I enable DFS (802.11h AND 802.11d) in IBSS mode (I mean 
> there's not hostapd.conf file)?
>
As I understand, IBSS is using wpa_supplicant and wpa_supplicant does 
not have DFS feature at this moment.

Thanks,
Peter

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
