Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-oi0-x244.google.com ([2607:f8b0:4003:c06::244])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aObxF-00014S-UT
 for ath10k@lists.infradead.org; Thu, 28 Jan 2016 02:05:03 +0000
Received: by mail-oi0-x244.google.com with SMTP id y78so1222768oif.3
 for <ath10k@lists.infradead.org>; Wed, 27 Jan 2016 18:04:41 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <56A93C56.5070205@codeaurora.org>
References: <1453920957-9908-1-git-send-email-poh@qca.qualcomm.com>
 <20160127193955.GC12639@localhost>
 <56A93C56.5070205@codeaurora.org>
Date: Thu, 28 Jan 2016 10:04:40 +0800
Message-ID: <CAEFj984ULyZNa5YcLXZngrsYNT43WZCX5CHJLZ5msfHMmNABdg@mail.gmail.com>
Subject: Re: [PATCH 0/4] ath10k: rename mesh and add abstraction layer
From: Yeoh Chun-Yeow <yeohchunyeow@gmail.com>
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
To: Peter Oh <poh@codeaurora.org>
Cc: "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, Bob Copeland <me@bobcopeland.com>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>, Peter Oh <poh@qca.qualcomm.com>

On Thu, Jan 28, 2016 at 5:53 AM, Peter Oh <poh@codeaurora.org> wrote:
>
> On 01/27/2016 11:39 AM, Bob Copeland wrote:
>>
>> On Wed, Jan 27, 2016 at 10:55:53AM -0800, Peter Oh wrote:
>>>
>>> Split Mesh service to 11s Mesh and non-11s Mesh according to
>>> firmware service bit to help users distinguish 11s Mesh from
>>> non 11s Mesh.
>>> And add abstraction layer for vdev subtype to solve subtype mismatch
>>> and to give flexible compatibility among different firmware revisions.
>>
>> Out of curiosity, which non-11s mesh, if you can share?
>
> non-11s Mesh can be anything, but 11s Mesh such as meraki mesh.
>

I thought that non-11s mesh is for meraki mesh since it is not 802.11s
implementation.

WMI_10_4_SERVICE_MESH_NON_11S for non IEEE802.11s Mesh
WMI_SERVICE_MESH_11S and WMI_VDEV_SUBTYPE_MESH for IEEE 802.11s Mesh

Correct me if I am wrong.

Thanks

----
Chun-Yeow

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
