Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth01.qualcomm.com ([65.197.215.72])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VEDD1-00022w-Te
 for ath10k@lists.infradead.org; Tue, 27 Aug 2013 06:57:00 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH 0/3] ath10k: initial per-VDEV FW statistics implementation
References: <1377516815-12660-1-git-send-email-bartosz.markowski@tieto.com>
Date: Tue, 27 Aug 2013 09:56:31 +0300
Message-ID: <87txibmxk0.fsf@kamboji.qca.qualcomm.com>
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
To: Bartosz Markowski <bartosz.markowski@tieto.com>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

Bartosz Markowski <bartosz.markowski@tieto.com> writes:

> FW 1.0.0.716 brings per-VDEV statistics. This patch-set implements
> debugfs mechanism to fetch those. There's still few more fileds we
> can read from the FW stats event, which are not covered here.
>
> Please note there's an ABI change in wmi_peer_stats structure, hence
> the PEER statistics will be corrupted if used with older firmware
> (e.g. 1.0.0.636)

We need to support the older firmware, so please add a feature flag VDEV
statistics so that we can detect which version of the struct needs to be
used.

Also I think you can fold patches 1 and 2.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
