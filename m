Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine02.qualcomm.com ([199.106.114.251])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WOPSb-0007RM-VW
 for ath10k@lists.infradead.org; Fri, 14 Mar 2014 10:35:31 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: Performance of ath10k
References: <005b01cf3f6b$6c6c4840$4544d8c0$@innovelec.co.uk>
Date: Fri, 14 Mar 2014 12:34:56 +0200
In-Reply-To: <005b01cf3f6b$6c6c4840$4544d8c0$@innovelec.co.uk> (Trevor
 Cullen's message of "Fri, 14 Mar 2014 09:54:41 +0000")
Message-ID: <87fvml83vz.fsf@kamboji.qca.qualcomm.com>
MIME-Version: 1.0
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
To: Trevor Cullen <tcc@innovelec.co.uk>
Cc: 'Vu Hai NGUYEN' <vh.nguyen@actiasodielec.fr>, ath10k@lists.infradead.org

Trevor Cullen <tcc@innovelec.co.uk> writes:

> There's much debate going on in my circles about this card. It's based on
> the QCA XB140 reference design which supposedly supports 11a,b,g,n, ac at
> 2.4G or 5G (not concurrent).
>
> So does ath10k support this card fully?

Fully? You do understand that there are a LOT of features in 802.11 :)

Few things which come to my mind:

* XB140 needs 10.1.467.2-1 firmware and Ad-Hoc is not supported in that
  firmware

* DFS works only on ETSI region

* mac80211 doesn't support VHT on 2.4 G

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
