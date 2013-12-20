Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine01.qualcomm.com ([199.106.114.254])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Vtx9R-00065l-PF
 for ath10k@lists.infradead.org; Fri, 20 Dec 2013 10:17:50 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: Unable to receive beacon in IBSS mode
References: <CAEFj986wMdEPuh=hRxL=6_CmWGp7eawB82+dq6M+c2EPVj9wNQ@mail.gmail.com>
Date: Fri, 20 Dec 2013 12:17:07 +0200
In-Reply-To: <CAEFj986wMdEPuh=hRxL=6_CmWGp7eawB82+dq6M+c2EPVj9wNQ@mail.gmail.com>
 (Yeoh Chun-Yeow's message of "Thu, 19 Dec 2013 21:28:47 +0800")
Message-ID: <87a9fv3jz0.fsf@kamboji.qca.qualcomm.com>
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
To: Yeoh Chun-Yeow <yeohchunyeow@gmail.com>
Cc: ath10k@lists.infradead.org

Yeoh Chun-Yeow <yeohchunyeow@gmail.com> writes:

> I have observed if you create the interface in the ath10k as IBSS mode
> (WMI_VDEV_TYPE_IBSS). The ath10k_wmi_event_mgmt_rx is not able to
> receive the beacon frame. This maybe the reason when the STA up as
> adhoc mode not able to join the network.
>
> But if you put the ath10k as AP mode (WMI_VDEV_TYPE_AP), you are able
> to receive the beacon.
>
> Is this the correct behavior?

I haven't done any IBSS tests myself, but what firmware version are you
using?

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
