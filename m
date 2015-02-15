Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth01.qualcomm.com ([65.197.215.72])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YN0uv-0007Sa-Ry
 for ath10k@lists.infradead.org; Sun, 15 Feb 2015 15:15:30 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH 0/4] ath10k: implement fw stats for wmi-tlv
References: <1422611244-20767-1-git-send-email-michal.kazior@tieto.com>
Date: Sun, 15 Feb 2015 17:15:00 +0200
In-Reply-To: <1422611244-20767-1-git-send-email-michal.kazior@tieto.com>
 (Michal Kazior's message of "Fri, 30 Jan 2015 10:47:20 +0100")
Message-ID: <87vbj3gqa3.fsf@kamboji.qca.qualcomm.com>
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
To: Michal Kazior <michal.kazior@tieto.com>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

Michal Kazior <michal.kazior@tieto.com> writes:

> There are some slight differences in fw stats
> (sic) in wmi-tlv.
>
> Firmware has changed the querying scheme and no
> longer requires the ping-pong to get all stats.
> The patchset doesn't change this behaviour so with
> wmi-tlv it's possible to see the following
> warnings when reading fw stats:
>
>  ath10k_pci 0000:00:06.0: received unsolicited stats update event
>
> The logic in ath10k still produces correct results
> so this is harmless.
>
> I wonder how to deal with this in a sane way. An
> `if (op_ver == WMI_TLV)` is a little bad but
> having a new ar->fw_feature flag just for a debug
> facility like this is a bit silly. Or we can just
> drop the warning and leave a comment. Ideas?

I think we could just drop the warning and leave a comment. That
shouldn't break anything, right?

> Michal Kazior (4):
>   ath10k: add vdev stats processing
>   ath10k: change request stats command prototype
>   ath10k: add more wmi fw stat defines
>   ath10k: implement fw stats for wmi-tlv

Thanks, applied to ath.git.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
