Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine01.qualcomm.com ([199.106.114.254])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WrXGb-0000ZQ-Ef
 for ath10k@lists.infradead.org; Mon, 02 Jun 2014 18:47:30 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH] ath10k: fix vdev map size for 10.x firmware
References: <1401370567-13543-1-git-send-email-bartosz.markowski@tieto.com>
Date: Mon, 2 Jun 2014 21:47:01 +0300
In-Reply-To: <1401370567-13543-1-git-send-email-bartosz.markowski@tieto.com>
 (Bartosz Markowski's message of "Thu, 29 May 2014 15:36:07 +0200")
Message-ID: <87k38zxi6y.fsf@kamboji.qca.qualcomm.com>
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

> Firmware 10.x supports up to 8 virtual AP interfaces
> (comparing to 7 for main firmware). Previous vdev map
> initialization was missing enough space for 8 + 1 vdevs
> (we may spent one for mac monitor), due to wrong define used.
>
> Use correct one - TARGET_10X_NUM_VDEVS - for 10.x firmware.
>
> Signed-off-by: Bartosz Markowski <bartosz.markowski@tieto.com>

Thanks, applied to ath-current with this commit log:

commit dfa413de1e4388818f7dcdce0a90d6212e74895b
Author: Bartosz Markowski <bartosz.markowski@tieto.com>
Date:   Mon Jun 2 21:19:45 2014 +0300

    ath10k: fix 8th virtual AP interface with DFS
    
    Firmware 10.x supports up to 8 virtual AP interfaces, but in a DFS
    channel it was possible to create only 7 interfaces as ath10k internal
    creates a monitor interface for DFS. Previous vdev map initialization
    was missing enough space for 8 + 1 vdevs due to wrong define used and
    that's why there was no space for 8th interface. Use the correct define
    TARGET_10X_NUM_VDEVS with 10.x firmware to make it possible to create
    the 8th virtual interface.
    
    Signed-off-by: Bartosz Markowski <bartosz.markowski@tieto.com>
    Signed-off-by: Kalle Valo <kvalo@qca.qualcomm.com>

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
